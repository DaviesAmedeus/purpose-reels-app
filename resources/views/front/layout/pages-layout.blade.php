<!DOCTYPE html>
<html lang="en-us">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=5">
    @yield('meta_tags')
    <link rel="shortcut icon" href="/images/site/{{ isset(settings()->site_favicon) ? settings()->site_favicon : '' }}"
        type="image/x-icon">
    <link rel="icon" href="/images/site/{{ isset(settings()->site_favicon) ? settings()->site_favicon : '' }}"
        type="image/x-icon">
    <link rel="stylesheet" href="{{ asset('front/plugins/bootstrap/bootstrap.min.css') }}">
    <link rel="stylesheet" href="{{ asset('front/css/animate.min.css') }}">
    <link rel="stylesheet" href="{{ asset('front/plugins/themify-icons/themify-icons.css') }}">
    <link rel="stylesheet" href="{{ asset('front/plugins/slick/slick.css') }}">
    <link rel="stylesheet" href="{{ asset('extra-assets/ijabo/css/ijabo.min.css') }}">
    <link rel="stylesheet" href="{{ asset('front/css/style.css') }}">
    @stack('stylesheets')
</head>

<body>
    <!-- navigation -->
    <header class="sticky-top bg-white border-bottom border-default">
        <div class="container">

            <nav class="navbar navbar-expand-lg navbar-white">
                <a class="navbar-brand" href="/">
                    <img class="img-fluid" width="150px"
                        src="/images/site/{{ isset(settings()->site_logo) ? settings()->site_logo : '' }}"
                        alt="{{ isset(settings()->site_title) ? settings()->site_title : '' }}">
                </a>
                <button class="navbar-toggler border-0" type="button" data-toggle="collapse" data-target="#navigation">
                    <i class="ti-menu"></i>
                </button>

                <div class="collapse navbar-collapse text-center" id="navigation">
                    <ul class="navbar-nav ml-auto">
                        <li class="nav-item">
                            <a class="nav-link" href="/">Nyumbani</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="{{ route('about') }}">Kuhusu</a>
                        </li>

                        {!! navigations() !!}
                        <li class="nav-item">
                            <a class="nav-link" href="{{ route('contact') }}">Mawasiliano</a>
                        </li>
                    </ul>

                    <!-- search -->
                    <div class="search px-4">
                        <button id="searchOpen" class="search-btn"><i class="ti-search"></i></button>
                        <div class="search-wrapper">
                            <form action="{{ route('search_posts') }}" method="GET" class="h-100">
                                <input class="search-box pl-4" id="search-query" name="q" type="search"
                                    placeholder="Andika kupata mafunzo, makala &amp; simulizi mbalimbali..."
                                    value="{{ request('q') ? request('q ') : '' }}">
                            </form>
                            <button id="searchClose" class="search-close"><i class="ti-close text-dark"></i></button>
                        </div>
                    </div>
                    <!-- /search -->

                    <!-- user detail + dropdown -->
                    @auth
                        <div class="user-details">
                            <img src="{{ auth()->user()->picture }}" alt="User Avatar">
                            <div class="user-dropdown">
                                <a href="{{ route('admin.dashboard') }}">
                                    <i class="ti-dashboard"></i>Dashboard
                                </a>
                                <a href="{{ route('admin.profile') }}">
                                    <i class="ti-user"></i>Profile
                                </a>
                                @if (auth()->user()->type == 'superAdmin')
                                    <a href="{{ route('admin.settings') }}">
                                        <i class="ti-settings"></i>Settings
                                    </a>
                                @endif

                                <form id="front-logout-form" action="{{ route('admin.logout', ['source'=>'front']) }}" method="POST" style="display: none;">
                                    @csrf
                                </form>
                                <a href="javascript:;" onclick="event.preventDefault();document.getElementById('front-logout-form').submit();">
                                    <i class="ti-power-off"></i>Logout
                                </a>
                            </div>
                        </div>
                    @endauth
                    <!-- /user detail + dropdown -->
                </div>
            </nav>
        </div>
    </header>
    <!-- /navigation -->

    <section class="section">
        <div class="container">
            @yield('content')
        </div>
    </section>

    <footer class="section-sm pb-0 border-top border-default">
        <div class="container">
            <div class="row justify-content-between">
                <div class="col-md-3 mb-4">
                    <a class="mb-4 d-block" href="/">
                        <img class="img-fluid" width="150px"
                            src="/images/site/{{ isset(settings()->site_logo) ? settings()->site_logo : '' }}"
                            alt="{{ isset(settings()->site_title) ? settings()->site_title : '' }}">
                    </a>
                    <p>{{ isset(settings()->site_meta_description) ? settings()->site_meta_description : '' }}</p>
                </div>

                <div class="col-lg-2 col-md-3 col-6 mb-4">
                    <h6 class="mb-4">Quick Links</h6>
                    <ul class="list-unstyled footer-list">
                        <li><a href="{{ route('contact') }}">Mawasiliano</a></li>
                        <li><a href="{{ route('about') }}">Kuhusu</a></li>
                        <li><a href="{{ route('privacy-policy') }}">Sera ya Faragha</a></li>
                        <li><a href="{{ route('terms-and-conditions') }}">Sheria na Masharti</a></li>
                    </ul>
                </div>

                <div class="col-lg-2 col-md-3 col-6 mb-4">
                    <h6 class="mb-4">Social Links</h6>
                    <ul class="list-unstyled footer-list">
                        @if (site_social_links()->facebook_url)
                        <li><a href="{{ site_social_links()->facebook_url }}" target="_blank">Facebook</a></li>
                        @endif
                        @if (site_social_links()->instagram_url)
                        <li><a href="{{ site_social_links()->instagram_url }}" target="_blank">Instagram</a></li>
                        @endif
                         @if (site_social_links()->linkedin_url)
                        <li><a href="{{ site_social_links()->linkedin_url }}" target="_blank">LinkedIn</a></li>
                        @endif
                    </ul>
                </div>

                <div class="col-md-3 mb-4">
                    <h6 class="mb-4">Subscribe Newsletter</h6>

                   @livewire('newsletter-form')
                </div>
            </div>
            <div class="scroll-top">
                <a href="javascript:void(0);" id="scrollTop"><i class="ti-angle-up"></i></a>
            </div>
            <div class="text-center">
                <p class="content"> Purpose Reels &copy; {{ date('Y') }}</p>
            </div>
        </div>
    </footer>


    <script src="{{ asset('front/plugins/jQuery/jquery.min.js') }}"></script>
    <script src="{{ asset('front/plugins/bootstrap/bootstrap.min.js') }}" async></script>
    <script src="{{ asset('front/plugins/slick/slick.min.js') }}"></script>
    <script src="{{ asset('extra-assets/ijabo/js/ijabo.min.js') }}"></script>
    <script src="{{ asset('front/js/script.js') }}"></script>
    <script>
        window.addEventListener('showToastr', function(event){
            $().notifa({
                vers:2,
                cssClass:event.detail[0].type,
                html:event.detail[0].message,
                delay:2500
            });
        });
    </script>
    <script>
        // toggle dropdown menu
        document.querySelector('.user-details').addEventListener('click', function() {
            this.classList.toggle('active');
        });

        // Close dropdown if user clicks outside
        document.addEventListener('click', function(e) {
            const userDetails = document.querySelector('.user-details');
            if (!userDetails.contains(e.target)) {
                userDetails.classList.remove('active');

            }
        });
    </script>
    @stack('scripts')
</body>

</html>
