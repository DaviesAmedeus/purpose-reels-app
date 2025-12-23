@extends('front.layout.pages-layout')
@section('pageTitle', isset($pageTitle) ? $pageTitle : 'Document title')
@section('meta_tags')
    {!! SEO::generate() !!}
@endsection
@section('content')
    <div class="row">
        <div class="col-lg-8  mb-5 mb-lg-0">
            <article class="row mb-4">
                <div class="col-lg-12 mb-2">
                    <h2 class="mb-3">{{ $post->title }}</h2>
                    <ul class="list-inline post-meta">
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
                </div>
                <div class="col-12 mb-3">
                    <img src="{{ asset('images/posts/' . $post->featured_image) }}" alt=""
                        class="img-fluid rounded-lg">
                </div>
                <!-- SHARE BUTTONS -->
                <div class="share-buttons">
                    <span class="title-color">Share: </span>
                    <a href="https://www.facebook.com/sharer/sharer.php?u=YOUR_URL" target="_blank" class="btn-facebook">
                        <i class="ti-facebook"></i>
                    </a>
                    <a href="https://twitter.com/intent/tweet?url=YOUR_URL&amp;text=YOUR_TEXT" target="_blank"
                        class="btn-twitter">
                        <i class="ti-twitter-alt"></i>
                    </a>
                    <a href="https://www.linkedin.com/sharing/share-offsite/?url=YOUR_URL" target="_blank"
                        class="btn-linkedin">
                        <i class="ti-linkedin"></i>
                    </a>
                    <a href="mailto:?subject=YOUR_SUBJECT&amp;body=YOUR_URL" target="_blank" class="btn-email">
                        <i class="ti-email"></i>
                    </a>
                </div>
                <!-- SHARE BUTTONS -->
                <div class="col-lg-12">
                    <div class="content">
                        {!! $post->content !!}
                    </div>
                </div>
            </article>
            <div class="prev-next-posts mt-3 mb-3">
                <div class="row justify-content-between p-4">
                    <div class="col-md-6 mb-2">

                        @if ($prevPost)
                            <div>
                                <h6>« Previous</h6>
                                <a href="{{ route('read_post', $prevPost->slug) }}">{{ $prevPost->title }}</a>
                            </div>
                        @endif

                    </div>
                    <div class="col-md-6 mb-2 text-md-right">
                        @if ($nextPost)
                            <div>
                                <h6>Next »</h6>
                                <a href="{{ route('read_post', $nextPost->slug) }}">{{ $nextPost->title }}</a>
                            </div>
                        @endif

                    </div>
                </div>
            </div>

            @if ($relatedPosts)
                <section>
                    <h4>Related Posts</h4>
                    <hr>
                    @foreach ($relatedPosts as $post)
                        <article class="row mb-5 mt-4">
                            <div class="col-md-4 mb-4 mb-md-0">
                                <div class="post-img-box">
                                    <img src="{{ asset('images/posts/resized/resized_' . $post->featured_image) }}" class="img-fluid rounded-lg" alt="post-thumb">
                                </div>
                            </div>
                            <div class="col-md-8">
                                <h4>
                                    <a class="post-title" href="{{ route('read_post', $post->slug) }}">
                                        Getting Started with Laravel: Your {{ $post->title }}
                                    </a>
                                </h4>
                                <ul class="list-inline post-meta mb-2">
                                    <li class="list-inline-item">
                                        <i class="ti-user mr-1"></i><a href="{{ route('author_posts', $post->author->username) }}">{{ $post->author->name }}</a>
                                    </li>
                                    <li class="list-inline-item">
                                        <i class="ti-calendar mr-1"></i>{{ date_formatter($post->created_at) }}
                                    </li>
                                    <li class="list-inline-item">
                                        Category : <a href="{{ route('category_posts', $post->post_category->slug) }}" class="ml-1">{{ $post->post_category->name }}</a>
                                    </li>
                                    <li class="list-inline-item">
                                        </i>
                                        {{ readDuration($post->title, $post->content) }} @choice('min|mins', readDuration($post->title, $post->content))
                                    </li>
                                </ul>
                               <p>{!! Str::ucfirst(words($post->content, 30)) !!}</p>
                                <a href="{{ route('read_post', $post->slug) }}" class="btn btn-outline-primary">Read more...</a>
                            </div>
                        </article>
                    @endforeach




                </section>
            @endif

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
                                <img loading="lazy" class="mr-3" src="{{ asset('/images/posts/resized/thumb_'.$item->featured_image) }}">
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
        </aside>
    </div>
@endsection
