<?php

namespace Modules\Customers\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Routing\Controller;
use Validator;
use Auth;

//Models
use App\Models\Customers;
use Response;
use DB;
use Illuminate\Support\Facades\Redis;
use App\Imports\ProductsImport;
use Maatwebsite\Excel\Facades\Excel;

class CustomersController extends Controller
{   
    public function __construct()
    {
        $this->middleware('auth');
    }
    
    public function index()
    {
        //
            if ((isset($_GET['birth_year'])) && ($_GET['birth_year'] != null))
            {
                $birth_year  = $_GET['birth_year'];
            }
            else
            {
                $birth_year  = 0;
            }

            if ((isset($_GET['birth_date'])) && ($_GET['birth_date'] != null))
            {
                $birth_date  = $_GET['birth_date'];
            }
            else
            {
                $birth_date  = 0;
            }

        //
            if ((isset($_GET['old_birth_year'])) && ($_GET['old_birth_year'] != null))
            {
                $old_birth_year  = $_GET['old_birth_year'];
            }
            else
            {
                $old_birth_year  = 0;
            }

            if ((isset($_GET['old_birth_date'])) && ($_GET['old_birth_date'] != null))
            {
                $old_birth_date  = $_GET['old_birth_date'];
            }
            else
            {
                $old_birth_date  = 0;
            }


        $redis      = Redis::connection();
        $data_find  = $redis->get('customers');

        //If search by any paramenter
        if ((isset($_GET['birth_year'])) || (isset($_GET['birth_date'])))
        {
            //If search by same parameter
            if (($birth_date == $old_birth_date) && ($birth_year == $old_birth_year))
            {
                //If Redis cache expires
                if ($data_find == null)
                {
                    $data       = Customers::when($birth_year != 0, function ($query) use ($birth_year) {
                                            return $query->whereYear('birth_date', $birth_year);
                                        })
                                        ->when($birth_date != 0, function ($query) use ($birth_date) {
                                            return $query->whereMonth('birth_date', $birth_date);
                                        })
                                        ->get();

                    $redis->set('customers', $data, 'EX', 60);
                }
            }
            else
            {
                //Search with empty paramenter
                if (($birth_date == 0) && ($birth_year == 0))
                {
                    $redis->set('customers', null); //Redis cache will be empty
                }
                else
                {
                    //New search result will be loaded for 60s
                    $redis->set('customers', null);
                    $data       = Customers::when($birth_year != 0, function ($query) use ($birth_year) {
                                                return $query->whereYear('birth_date', $birth_year);
                                            })
                                            ->when($birth_date != 0, function ($query) use ($birth_date) {
                                                return $query->whereMonth('birth_date', $birth_date);
                                            })
                                            ->get();

                    $redis->set('customers', $data, 'EX', 60);
                }
            }
        }
        else
        {
            $redis->set('customers', null); //If no search datatable is empty
        }

        return view('customers::index');
    }

    public function loadCustomerDatatable()
    {
        ## Read value
        $draw            = $_GET['draw'];
        $row             = $_GET['start'];
        $rowperpage      = $_GET['length']; // Rows display per page
        $columnIndex     = $_GET['order'][0]['column']; // Column index
        $columnName      = $_GET['columns'][$columnIndex]['data']; // Column name
        $columnSortOrder = $_GET['order'][0]['dir']; // asc or desc
        $searchValue     = $_GET['search']['value']; // Search value

        $redis      = Redis::connection();
        $customers  = collect(json_decode($redis->get('customers'), true));

        ## Total number of records without filtering
        $totalRecords    = $customers->count();
    

        ## Total number of record with filtering
        if ($searchValue)
        {
            $frecords = $customers->where('country', $searchValue);

            if ($frecords->count() == 0)
            {
                $frecords = $customers->where('name', $searchValue);
            }

            if ($frecords->count() == 0)
            {
                $frecords = $customers->where('email', $searchValue);
            }

            if ($frecords->count() == 0)
            {
                $frecords = $customers->where('phone', $searchValue);
            }

            if ($frecords->count() == 0)
            {
                $frecords = $customers->where('ip_address', $searchValue);
            }
        }
        else
        {
            $frecords = $customers;
        }
        

        $totalRecordwithFilter  = $frecords->count();


        ## Fetch records
        if ($searchValue)
        {
            $empQuery   = $customers->where('country', $searchValue)->skip($row)->take($rowperpage);

            if ($empQuery->count() == 0)
            {
                $empQuery   = $customers->where('name', $searchValue)->skip($row)->take($rowperpage);
            }

            if ($empQuery->count() == 0)
            {
                $empQuery   = $customers->where('email', $searchValue)->skip($row)->take($rowperpage);
            }

            if ($empQuery->count() == 0)
            {
                $empQuery   = $customers->where('phone', $searchValue)->skip($row)->take($rowperpage);
            }

            if ($empQuery->count() == 0)
            {
                $empQuery   = $customers->where('ip_address', $searchValue)->skip($row)->take($rowperpage);
            }
        }
        else
        {
            $empQuery   = $customers->skip($row)->take($rowperpage);
        }
        
    
        $data   = array();
        $i      = $row;
        foreach ($empQuery as $key => $value)
        {
            $i++;

            $data[] = array( 
              "sl"          => $i,
              "name"        => $value['name'],
              "id"          => $value['id'],
              "email"       => $value['email'],
              "phone"       => $value['phone'],
              "birth_date"  => date('d-m-Y', strtotime($value['birth_date'])),
              "ip_address"  => $value['ip_address'],
              "country"     => $value['country'],
           );
        }


        ## Response
        $response = array(
          "draw"                 => intval($draw),
          "iTotalRecords"        => $totalRecords,
          "iTotalDisplayRecords" => $totalRecordwithFilter,
          "aaData"               => $data
        );

        return Response::json($response);
    }

    public function importProductList(Request $request)
    {
        $rows   = Excel::toArray(new ProductsImport, $request->file('import_excel')); 

        DB::beginTransaction();

        try{
            foreach ($rows[0] as $key => $value)
            {   
                if ($key != 0)
                {   
                    if ($value[0] != null)
                    {
                        $id             = preg_replace('/[^(\x20-\x7F)]*/','', $value[0]);
                        $email          = preg_replace('/[^(\x20-\x7F)]*/','', $value[1]);
                        $name           = preg_replace('/[^(\x20-\x7F)]*/','', $value[2]);
                        $birth_date     = $value[3];
                        $phone          = $value[4];
                        $ip_address     = $value[5];
                        $country        = preg_replace('/[^(\x20-\x7F)]*/','', $value[6]);

                        $customers[] = [
                            'id'            => $id,
                            'name'          => $name,
                            'phone'         => $phone,
                            'email'         => $email,
                            'birth_date'    => $birth_date,
                            'ip_address'    => $ip_address,
                            'country'       => $country,
                        ];

                    }
                }
            }

            DB::table('customers')->insert($customers);

            DB::commit();
            return back()->with("success","Customer List Added Successfully !!");

        }catch (\Exception $exception){
            DB::rollback();
            dd($exception);
            return back()->with("unsuccess","Not Added");
        }
    }
}
