<style type="text/css">
    .m-5 {
        margin: 0.7rem 0.1rem !important;
        font-size: 1.4rem !important; 
    }
</style>

<header id="page-topbar">
    <div class="navbar-header">
        <div class="d-flex">
            <div style="padding: 0rem !important" class="navbar-brand-box">
                <a href="<?php echo e(route('home')); ?>" class="logo logo-light">
                    <span class="logo-sm"></span>
                    <span class="logo-lg"></span>
                </a>
            </div>

            <button type="button" class="btn btn-sm px-3 font-size-16 header-item waves-effect" id="vertical-menu-btn">
                <i class="fa fa-fw fa-bars"></i>
            </button>
        </div>

        <div class="d-flex">
            <div class="dropdown d-inline-block">

                <button style="font-size: 0.8125rem !important" type="button" class="btn header-item waves-effect" id="page-header-user-dropdown"
                    data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    <?php if(Auth::user()->photo != null): ?>
                    <img class="rounded-circle header-profile-user" src="<?php echo e(url('public/'. Auth::user()->photo)); ?>"
                        alt="Header Avatar">
                    <?php else: ?>
                    <img class="rounded-circle header-profile-user" src="<?php echo e(url('public/default.png')); ?>"
                        alt="Header Avatar">
                    <?php endif; ?>
                    <span class="d-none d-xl-inline-block ml-1"><?php echo e(Auth::user()->name); ?></span>
                    <i class="mdi mdi-chevron-down d-none d-xl-inline-block"></i>
                </button>
                <div class="dropdown-menu dropdown-menu-right">
                    <a class="dropdown-item text-danger" href="<?php echo e(route('logout')); ?>"
                                       onclick="event.preventDefault();
                                                     document.getElementById('logout-form').submit();"><i class="bx bx-power-off font-size-16 align-middle mr-1 text-danger"></i> Logout</a> 
                    <form id="logout-form" action="<?php echo e(route('logout')); ?>" method="POST" style="display: none;">
                        <?php echo csrf_field(); ?>
                    </form>
                </div>
            </div>
        </div>
    </div>
</header><?php /**PATH H:\xampp\htdocs\cyberdyne-point-of-sales\32\35\resources\views\layouts\top_nav_item.blade.php ENDPATH**/ ?>