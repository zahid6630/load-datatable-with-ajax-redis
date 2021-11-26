<!doctype html>
<html class="fixed">
    <head>
        <!-- Basic -->
        <meta charset="UTF-8">
        <title>Login</title>
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

        <!-- Mobile Metas -->
        <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
        <!-- Vendor CSS -->
        <link rel="stylesheet" href="<?php echo e(url('public/login_form_assets/assets/vendor/bootstrap/css/bootstrap.css')); ?>" />

        <link rel="stylesheet" href="<?php echo e(url('public/login_form_assets/assets/vendor/font-awesome/css/font-awesome.css')); ?>" />

        <!-- Theme CSS -->
        <link rel="stylesheet" href="<?php echo e(url('public/login_form_assets/assets/stylesheets/theme.css')); ?>" />

        <!-- Skin CSS -->
        <link rel="stylesheet" href="<?php echo e(url('public/login_form_assets/assets/stylesheets/skins/default.css')); ?>" />

        <!-- Theme Custom CSS -->
        <link rel="stylesheet" href="<?php echo e(url('public/login_form_assets/assets/stylesheets/theme-custom.css')); ?>">

    </head>
    <body>
        <!-- start: page -->
        <section class="body-sign">
            <div class="center-sign">
                <a href="<?php echo e(url('/')); ?>" class="logo pull-left">
                </a>

                <div class="panel panel-sign">
                    <div class="panel-title-sign mt-xl text-right">
                        <h2 class="title text-uppercase text-weight-bold m-none"><i class="fa fa-user mr-xs"></i> Sign In</h2>
                    </div>
                    <div class="panel-body">
                        <form class="form-horizontal" role="form" method="POST" action="<?php echo e(route('login')); ?>">
                        <?php echo csrf_field(); ?>
                            <div class="form-group mb-lg">
                                <label>Username</label>
                                <div class="input-group input-group-icon">
                                    <input name="email" type="text" class="form-control input-lg" value="admin@mail.com"/>
                                    <span class="input-group-addon">
                                        <span class="icon icon-lg">
                                            <i class="fa fa-user"></i>
                                        </span>
                                    </span>
                                </div>
                            </div>

                            <div class="form-group mb-lg">
                                <div class="clearfix">
                                    <label class="pull-left">Password</label>
                                </div>
                                <div class="input-group input-group-icon">
                                    <input name="password" type="password" class="form-control input-lg" value="12345" />
                                    <span class="input-group-addon">
                                        <span class="icon icon-lg">
                                            <i class="fa fa-lock"></i>
                                        </span>
                                    </span>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-sm-8">
                                    <div class="checkbox-custom checkbox-default">
                                        <input id="RememberMe" name="remember" <?php echo e(old('remember') ? 'checked' : ''); ?> type="checkbox"/>
                                        <label for="RememberMe">Remember Me</label>
                                    </div>
                                </div>
                                <div class="col-sm-4 text-right">
                                    <button type="submit" class="btn btn-primary hidden-xs">Sign In</button>
                                    <button type="submit" class="btn btn-primary btn-block btn-lg visible-xs mt-lg">Sign In</button>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>

                <p class="text-center text-muted mt-md mb-md">&copy; Copyright <?php echo e(date('Y')); ?>. All Rights Reserved.</p>
            </div>
        </section>
    </body>
</html><?php /**PATH H:\xampp\htdocs\cyberdyne-point-of-sales\32\35\resources\views/auth/login.blade.php ENDPATH**/ ?>