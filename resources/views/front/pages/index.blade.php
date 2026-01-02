@extends('front.layout.pages-layout')
@section('pageTitle', isset($pageTitle) ? $pageTitle : 'Document title')
@section('meta_tags')
    {!! SEO::generate() !!}
@endsection
@section('content')

    <div class="row">
        <div class="col-lg-8  mb-5 mb-lg-0">
            <article class="row mb-5">

                @if(!empty(get_slides()))
                    <div class="col-12">
                        <div class="post-slider">
                            @foreach (get_slides() as $slide)
                                <div class="slider-item">
                                    <img loading="lazy" src="{{ asset('images/slides/' . $slide->image) }}" class="img-fluid"
                                        alt="post-thumb">
                                    <div class="slider-content">
                                        @if ($slide->link)
                                            <a href="{{ $slide->link }}">
                                                <h2 class="animate__animated">{{ $slide->heading }}</h2>
                                            </a>
                                        @else
                                            <h2 class="animate__animated">{{ $slide->heading }}</h2>
                                        @endif
                                    </div>
                                </div>
                            @endforeach
                        </div>
                    </div>
                @endif

                @if (!empty(latest_posts(0, 1)))
                    @foreach (latest_posts(0, 1) as $post)
                        <div class="col-12 mx-auto">
                            <h3>
                                <a class="post-title" href="{{ route('read_post', $post->slug) }}">
                                    {{ $post->title }}
                                </a>
                            </h3>
                            <ul class="list-inline post-meta mb-4">
                                <li class="list-inline-item"><i class="ti-user mr-1"></i>
                                    <a
                                        href="{{ route('author_posts', $post->author->username) }}">{{ $post->author->name }}</a>
                                </li>
                                <li class="list-inline-item"><i
                                        class="ti-calendar mr-1"></i>{{ date_formatter($post->created_at) }}</li>
                                <li class="list-inline-item">Category : <a
                                        href="{{ route('category_posts', $post->post_category->slug) }}"
                                        class="ml-1">{{ $post->post_category->name }}
                                    </a>
                                </li>
                                <li class="list-inline-item"> <i class="ti-timer mr-1"></i>
                                    {{ readDuration($post->title, $post->content) }} @choice('min|mins', readDuration($post->title, $post->content))
                                </li>
                            </ul>
                            <p>{!! Str::ucfirst(words($post->content, 45)) !!}</p>
                            <a href="{{ route('read_post', $post->slug) }}" class="btn btn-outline-primary">Read
                                more...</a>
                        </div>
                    @endforeach
                @endif


            </article>

            <section id="home__latest-posts">
                @if (!empty(latest_posts(1, 3)))
                    @foreach (latest_posts(1, 3) as $post)
                        <article class="row mb-5">
                            <div class="col-md-4 mb-4 mb-md-0">
                                <div class="post-img-box">
                                    <img src="{{ asset('images/posts/resized/resized_' . $post->featured_image) }}"
                                        class="img-fluid rounded-lg" alt="post-thumb">
                                </div>
                            </div>
                            <div class="col-md-8">
                                <h4>
                                    <a class="post-title" href="{{ route('read_post', $post->slug) }}">
                                        {{ $post->title }}
                                    </a>
                                </h4>
                                <ul class="list-inline post-meta mb-2">
                                    <li class="list-inline-item"><i class="ti-user mr-2"></i><a
                                            href="{{ route('author_posts', $post->author->username) }}">{{ $post->author->name }}</a>
                                    </li>
                                    <li class="list-inline-item">Date : {{ date_formatter($post->created_at) }}</li>
                                    <li class="list-inline-item">Category : <a
                                            href="{{ route('category_posts', $post->post_category->slug) }}"
                                            class="ml-1">{{ $post->post_category->name }}</a>
                                    </li>
                                    <li class="list-inline-item"><i class="ti-timer mr-1"></i>
                                        {{ readDuration($post->title, $post->content) }} @choice('min|mins', readDuration($post->title, $post->content))
                                    </li>
                                </ul>
                                <p>{!! Str::ucfirst(words($post->content, 30)) !!}</p>
                                <a href="{{ route('read_post', $post->slug) }}" class="btn btn-outline-primary">Read
                                    more...</a>
                            </div>
                        </article>
                    @endforeach

                @endif


            </section>


        </div>
        <aside class="col-lg-4">
            <!-- Search -->
            <x-sidebaer-search />
            <!-- categories -->
            <x-sidebar-categories />
            <!-- tags -->
            <x-sidebar-tags />
            <!-- latest post -->
            <div class="widget">
                <h5 class="widget-title"><span>Latest Article</span></h5>
                <!-- post-item -->
                @foreach (sidebar_latest_posts() as $item)
                    <ul class="list-unstyled widget-list">
                        <li class="media widget-post align-items-center">
                            <a href="{{ route('read_post', $post->slug) }}">
                                <img loading="lazy" class="mr-3"
                                    src="{{ asset('/images/posts/resized/thumb_' . $item->featured_image) }}">
                            </a>
                            <div class="media-body">
                                <h6 class="mb-0">
                                    <a href="{{ route('read_post', $post->slug) }}">{{ $item->title }}</a>
                                </h6>
                                <small>{{ date_formatter($item->created_at) }}</small>
                            </div>
                        </li>
                    </ul>
                @endforeach


            </div>
            <div class="d-flex align-items-center justify-content-center" style="background-color: #655087; height: 200px;">
                <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 300 600" class="w-100 h-100 rounded-lg">
                    <rect width="100%" height="100%" fill="#655087" />
                    <text x="50%" y="50%" fill="white" font-size="36" font-family="Arial, sans-serif" text-anchor="middle"
                        dy=".3em">
                        Ad Space
                    </text>
                </svg>
            </div>
        </aside>
    </div>
@endsection
