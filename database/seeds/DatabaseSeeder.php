<?php

use Illuminate\Database\Seeder;

class DatabaseSeeder extends Seeder
{
    /**
     * Seed the application's database.
     *
     * @return void
     */
    public function run()
    {
        DB::table('users')->insert([
            'name' 		=> 'Cyberdyne Technology Ltd.',
            'email' 	=> '01718937082',
            'password' 	=> Hash::make('123456'),
        ]);
    }
}
