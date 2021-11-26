

<?php $__env->startSection('title', 'List of Email Accounts'); ?>

<?php $__env->startSection('content'); ?>
    <div class="main-content">
        <div class="page-content">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-12">
                        <div class="page-title-box d-flex align-items-center justify-content-between">
                            <h4 class="mb-0 font-size-18">List of Email Accounts</h4>

                            <div class="page-title-right">
                                <ol class="breadcrumb m-0">
                                    <li class="breadcrumb-item"><a href="javascript: void(0);">Email Accounts</a></li>
                                    <li class="breadcrumb-item active">List of Email Accounts</li>
                                </ol>
                            </div>

                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="col-12">
                        <?php if(Session::has('success')): ?>
                        <div class="alert alert-success alert-dismissible fade show" role="alert">
                            <?php echo Session::get('success'); ?>

                            <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                                <span aria-hidden="true">×</span>
                            </button>
                        </div>
                        <?php endif; ?>

                        <?php if(Session::has('unsuccess')): ?>
                        <div class="alert alert-primary alert-dismissible fade show" role="alert">
                            <?php echo Session::get('unsuccess'); ?>

                            <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                                <span aria-hidden="true">×</span>
                            </button>
                        </div>
                        <?php endif; ?>

                        <?php if(Session::has('errors')): ?>
                        <div class="alert alert-primary alert-dismissible fade show" role="alert">
                            <?php echo 'Some required fields are missing..!! Please try again..'; ?>

                            <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                                <span aria-hidden="true">×</span>
                            </button>
                        </div>
                        <?php endif; ?>

                        <div class="card">
                            <div class="card-body table-responsive">

                                <form methode="GET" action="<?php echo e(route('customers_index')); ?>">
                                    <div class="row">
                                        <div class="col-lg-3 col-md-3 col-sm-12 col-12 form-group margin-bottom-10-xs">
                                            <label style="padding-left: 0px" class="col-lg-12 col-md-12 col-sm-12 col-12 col-form-label">Birth Year</label>
                                            <input id="birth_year" name="birth_year" type="text" class="form-control" placeholder="Enter Birth Year Example: 1994" value="<?php echo e(isset($_GET['birth_year']) ? $_GET['birth_year'] : ''); ?>">
                                            <input name="old_birth_year" type="hidden" value="<?php echo e(isset($_GET['birth_year']) ? $_GET['birth_year'] : ''); ?>">
                                        </div>

                                        <div class="col-lg-3 col-md-3 col-sm-12 col-12 form-group margin-bottom-10-xs">
                                            <label style="padding-left: 0px" class="col-lg-12 col-md-12 col-sm-12 col-12 col-form-label">Birth Date</label>
                                            <input id="birth_date" name="birth_date" type="text" class="form-control" placeholder="Enter Birth Date Example: 12" value="<?php echo e(isset($_GET['birth_date']) ? $_GET['birth_date'] : ''); ?>">
                                            <input name="old_birth_date" type="hidden" value="<?php echo e(isset($_GET['birth_date']) ? $_GET['birth_date'] : ''); ?>">
                                        </div>

                                        <div style="margin-top: 36px" class="col-lg-2 col-md-2 col-sm-12 col-12 form-group margin-bottom-10-xs">
                                            <button type="submit" class="btn btn-success">Filter</button>
                                        </div>
                                    </div>
                                </form>

                                <!-- <form id="FormSubmit" action="<?php echo e(route('products_import_product_list')); ?>" method="post" files="true" enctype="multipart/form-data">
                                    <?php echo e(csrf_field()); ?>

                                    <div class="row">
                                        <div class="col-lg-1 col-md-1 col-sm-12 col-12 form-group margin-bottom-10-xs">
                                        </div>
                                        <div class="col-lg-2 col-md-2 col-sm-12 col-12 form-group margin-bottom-10-xs">
                                            <label style="text-align: right" class="col-lg-12 col-md-12 col-sm-12 col-12 col-form-label">Upload Exel </label>
                                        </div>

                                        <div class="col-lg-4 col-md-4 col-sm-12 col-12 form-group margin-bottom-10-xs">
                                            <input type="file" name="import_excel" class="form-control">
                                        </div>
                                        <div class="col-lg-2 col-md-2 col-sm-12 col-12 form-group margin-bottom-10-xs">
                                            <button type="submit" class="btn btn-primary waves-effect waves-light">Save</button>
                                        </div>
                                        <div class="col-lg-3 col-md-3 col-sm-12 col-12 form-group margin-bottom-10-xs">
                                        </div>
                                    </div>
                                </form> -->

                                <hr>
                                
                                <table id="der" class="table table-bordered" style="border-collapse: collapse; border-spacing: 0; width: 100%;">
                                    <thead>
                                        <tr>
                                            <th>SL</th>
                                            <th>Name</th>
                                            <th>ID</th>
                                            <th>Email</th>
                                            <th>Phone</th>
                                            <th>Birth Date</th>
                                            <th>IP</th>
                                            <th>Country</th>
                                        </tr>
                                    </thead>
                                </table>

                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
<?php $__env->stopSection(); ?>

<?php $__env->startSection('scripts'); ?>
<script type="text/javascript">
        $( document ).ready(function() {
            
            var site_url        = $('.site_url').val();

            $('#der').DataTable({
                processing: true,
                serverSide: true,
                pageLength: 20,
                ajax: {
                    url: site_url + '/customers/load-customer-datatable/',
                    type: 'GET',
                    // success: function (data) {
                    //     console.log(data);
                    // },
                },
                columns: [
                    {data: 'sl'},
                    {data: 'name'},
                    {data: 'id'},
                    {data: 'email'},
                    {data: 'phone'},
                    {data: 'birth_date'},
                    {data: 'ip_address'},
                    {data: 'country'}
                ],
            });
        });
    </script>
<?php $__env->stopSection(); ?>
<?php echo $__env->make('layouts.app', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?><?php /**PATH H:\xampp\htdocs\cyberdyne-point-of-sales\32\35\Modules\Customers\Resources\views\index.blade.php ENDPATH**/ ?>