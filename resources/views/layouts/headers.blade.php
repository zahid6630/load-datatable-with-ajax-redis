<div class="vertical-menu">
    <div data-simplebar class="h-100">
        <div id="sidebar-menu">
            <ul class="metismenu list-unstyled" id="side-menu">
                <li class="menu-title">Menu</li>

                <li>
                    <a href="{{ url('/home') }}" class="waves-effect">
                        <i class="fa fa-home"></i>
                        <span>Dashboard</span>
                    </a>
                </li>

                <li>
                    <a href="{{ route('customers_index') }}" class="waves-effect">
                        <i class="fas fa-envelope"></i>
                        <span>Email Accounts</span>
                    </a>
                </li>                
            </ul>
        </div>
    </div>
</div>