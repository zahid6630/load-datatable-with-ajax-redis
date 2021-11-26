<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title> <?php echo $__env->yieldContent('title'); ?></title>
        <meta name="keywords" content="">
        <meta name="Developed By" content="https://kbmzahidhasan.com/" />
        <meta name="Developer" content="K B M Zahid Hasan | +8801905111957" />
        <meta property="fb:pages" content="" />
        <meta name="description" content="" />
        <meta property="og:url" content="https://kbmzahidhasan.com/" />
        <meta property="og:type" content="WEBSITE" />
        <meta property="og:title" content="K B M Zahid Hasan" />
        <meta property="og:description" content="" />
        <meta property="og:site_name" content="" />
        <link rel="canonical" href="https://kbmzahidhasan.com/">
        <meta property="og:image:width" content="700" />
        <meta property="og:image:height" content="400" />
        <link rel="icon" type="image/png" href="<?php echo e(url('/public/favicon.png')); ?>" />
        <!-- DataTables -->
        <link href="<?php echo e(url('public/admin_panel_assets/libs/datatables.net-bs4/css/dataTables.bootstrap4.min.css')); ?>" rel="stylesheet" type="text/css" />
        <link href="<?php echo e(url('public/admin_panel_assets/libs/datatables.net-buttons-bs4/css/buttons.bootstrap4.min.css')); ?>" rel="stylesheet" type="text/css" />

        <!-- Responsive datatable examples -->
        <link href="<?php echo e(url('public/admin_panel_assets/libs/datatables.net-responsive-bs4/css/responsive.bootstrap4.min.css')); ?>" rel="stylesheet" type="text/css" />   

        <link href="<?php echo e(url('public/admin_panel_assets/libs/select2/css/select2.min.css')); ?>" rel="stylesheet" type="text/css" />
        <link href="<?php echo e(url('public/admin_panel_assets/libs/bootstrap-datepicker/css/bootstrap-datepicker.min.css')); ?>" rel="stylesheet">
        <link href="<?php echo e(url('public/admin_panel_assets/libs/bootstrap-colorpicker/css/bootstrap-colorpicker.min.css')); ?>" rel="stylesheet">
        <link href="<?php echo e(url('public/admin_panel_assets/libs/bootstrap-touchspin/jquery.bootstrap-touchspin.min.css')); ?>" rel="stylesheet" />  

        <!-- Bootstrap Css -->
        <link href="<?php echo e(url('public/admin_panel_assets/css/bootstrap.min.css')); ?>" id="bootstrap-style" rel="stylesheet" type="text/css" />
        <!-- Icons Css -->
        <link href="<?php echo e(url('public/admin_panel_assets/css/icons.min.css')); ?>" rel="stylesheet" type="text/css" />
        <!-- App Css-->
        <link href="<?php echo e(url('public/admin_panel_assets/css/app.min.css')); ?>" id="app-style" rel="stylesheet" type="text/css" />
    </head>

    <style type="text/css">
        @media (max-width: 650px) {
            .hidden-xs {
                display: none !important;
            }

            .show-xs {
                display: block !important;
            }

            .width-xs {
                width: 200px !important;
            }

            .margin-top-25-xs {
                margin-top: 25px !important;
            }

            .margin-top-18-xs {
                margin-top: 18px !important;
            }

            .margin-top-20-xs {
                margin-top: 20px !important;
            }

            .margin-top-25-xs {
                margin-top: 25px !important;
            }

            .margin-top-15-xs {
                margin-top: 15px !important;
            }

            .margin-top-13-xs {
                margin-top: 13px !important;
            }

            .margin-top-10-xs {
                margin-top: 10px !important;
            }

            .margin-bottom-0-xs {
                margin-bottom: 0px !important;
            }

            .margin-bottom-10-xs {
                margin-bottom: 10px !important;
            }

            .padding-bottom-10-xs {
                padding-bottom: 10px !important;
            }

            .margin-top-5-xs {
                margin-top: 5px !important;
            }

            .margin-top-3-xs {
                margin-top: 3px !important;
            }

            .margin-left-15-xs {
                margin-left: 15px !important;
            }

            .padding-left-0-xs {
                padding-left: 0px !important;
            }

            .padding-left-5-xs {
                padding-left: 5px !important;
            }

            .margin-right-10-xs {
                margin-right: 10px !important;
            }

            .font-size-xs {
                font-size : 11px !important;
            }
        }

        .datepicker {
            z-index: 1005!important;
        }

        label {
            color: black !important;
        }

        @media  print {
            ::-webkit-scrollbar {
                display: none;
            }
        }

        .form-control {
            color: black !important;
        }

        .col-form-label {
            color: black !important;
        }

        .table {
            color: black !important;
        }

        .topnav .navbar-nav .nav-link {
            color: black !important;
        }

        .dropdown-item{
            color: black !important;
        }

        .blackColor{
            color: black !important;
        }

        .m-5 {
            margin: 0rem!important;
            font-size: 1.4rem !important; 
        }

        .footer {
            height: 45px !important;
        }

        <?php echo $__env->yieldPushContent('styles'); ?>
    </style>

    <body data-sidebar="dark">
        <div id="layout-wrapper">
            <?php echo $__env->make('layouts.top_nav_item', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?>
            <?php echo $__env->make('layouts.headers', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?>
            <?php echo $__env->yieldContent('content'); ?>
            
            <!-- Footer -->
            <footer class="footer">
                <div class="container-fluid">
                    <div class="row">
                        <div class="col-sm-2">
                        </div>
                        <div class="col-sm-10">
                            <div class="text-sm-right d-none d-sm-block blackColor">
                               ©<?php echo e(date('Y')); ?> K B M Zahid Hasan | Contact : +8801905111957 | <a href="https://kbmzahidhasan.com/" target="_blank">K B M Zahid Hasan</a>
                            </div>
                        </div>
                    </div>
                </div>
            </footer>

            <!-- JAVASCRIPT -->
            <script src="<?php echo e(url('public/admin_panel_assets/libs/jquery/jquery.min.js')); ?>"></script>
            <script src="<?php echo e(url('public/admin_panel_assets/libs/bootstrap/js/bootstrap.bundle.min.js')); ?>"></script>
            <script src="<?php echo e(url('public/admin_panel_assets/libs/metismenu/metisMenu.min.js')); ?>"></script>
            <script src="<?php echo e(url('public/admin_panel_assets/libs/simplebar/simplebar.min.js')); ?>"></script>
            <script src="<?php echo e(url('public/admin_panel_assets/libs/node-waves/waves.min.js')); ?>"></script>

            <!-- Required datatable js -->
            <script src="<?php echo e(url('public/admin_panel_assets/libs/datatables.net/js/jquery.dataTables.min.js')); ?>"></script>
            <script src="<?php echo e(url('public/admin_panel_assets/libs/datatables.net-bs4/js/dataTables.bootstrap4.min.js')); ?>"></script>
            <!-- Buttons examples -->
            <script src="<?php echo e(url('public/admin_panel_assets/libs/datatables.net-buttons/js/dataTables.buttons.min.js')); ?>"></script>
            <script src="<?php echo e(url('public/admin_panel_assets/libs/datatables.net-buttons-bs4/js/buttons.bootstrap4.min.js')); ?>"></script>
            <!-- <script src="<?php echo e(url('public/admin_panel_assets/libs/jszip/jszip.min.js')); ?>"></script> -->
            <!-- <script src="<?php echo e(url('public/admin_panel_assets/libs/pdfmake/build/pdfmake.min.js')); ?>"></script> -->
            <!-- <script src="<?php echo e(url('public/admin_panel_assets/libs/pdfmake/build/vfs_fonts.js')); ?>"></script> -->
            <script src="<?php echo e(url('public/admin_panel_assets/libs/datatables.net-buttons/js/buttons.html5.min.js')); ?>"></script>
            <script src="<?php echo e(url('public/admin_panel_assets/libs/datatables.net-buttons/js/buttons.print.min.js')); ?>"></script>
            <script src="<?php echo e(url('public/admin_panel_assets/libs/datatables.net-buttons/js/buttons.colVis.min.js')); ?>"></script>
            
            <!-- Responsive examples -->
            <script src="<?php echo e(url('public/admin_panel_assets/libs/datatables.net-responsive/js/dataTables.responsive.min.js')); ?>"></script>
            <script src="<?php echo e(url('public/admin_panel_assets/libs/datatables.net-responsive-bs4/js/responsive.bootstrap4.min.js')); ?>"></script>

            <!-- Datatable init js -->
            <script src="<?php echo e(url('public/admin_panel_assets/js/pages/datatables.init.js')); ?>"></script>

            <script src="<?php echo e(url('public/admin_panel_assets/libs/select2/js/select2.min.js')); ?>"></script>
            <script src="<?php echo e(url('public/admin_panel_assets/libs/bootstrap-datepicker/js/bootstrap-datepicker.min.js')); ?>"></script>
            <script src="<?php echo e(url('public/admin_panel_assets/libs/bootstrap-colorpicker/js/bootstrap-colorpicker.min.js')); ?>"></script>
            <script src="<?php echo e(url('public/admin_panel_assets/libs/bootstrap-touchspin/jquery.bootstrap-touchspin.min.js')); ?>"></script>
            <script src="<?php echo e(url('public/admin_panel_assets/libs/bootstrap-maxlength/bootstrap-maxlength.min.js')); ?>"></script>

            <script src="<?php echo e(url('public/admin_panel_assets/js/pages/form-advanced.init.js')); ?>"></script>    

            <script src="<?php echo e(url('public/admin_panel_assets/js/app.js')); ?>"></script>

            <?php echo $__env->yieldContent('scripts'); ?>

            <?php echo $__env->yieldPushContent('scripts'); ?>
            <input type="hidden" class="site_url" value="<?php echo e(url('/')); ?>" />
        </div>
    </body>
</html><?php /**PATH H:\xampp\htdocs\cyberdyne-point-of-sales\32\35\resources\views\layouts\app.blade.php ENDPATH**/ ?>