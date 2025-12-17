@extends('front.layout.pages-layout')
@section('pageTitle', isset($pageTitle) ? $pageTitle : 'Document title')
@section('content')
@section('meta_tags')
    {!! SEO::generate() !!}
@endsection
<div class="w-full mb-3">
    <h3 class="title-color">{{ $pageTitle }}</h3>
</div>

@if ($posts->count())
<div class="row">
    @foreach ($posts as $post)
<div class="col-sm-6 col-md-4 col-lg-3 mb-2">
        <article class="mb-2">
            <div class="mb-2">
                <img src="{{ asset('images/posts/resized/resized_'.$post->featured_image) }}" alt="" class="img-fluid rounded-lg">
            </div>

            <h5>
                <a class="post-title" href="{{ route('read_post',$post->slug) }}">
                    {{ $post->title }}
                </a>
            </h5>
            <ul class="list-inline post-meta mb-2">
                <li class="list-inline-item">Date : {{ date_formatter($post->created_at) }}</li>
                <li class="list-inline-item">Author : <a href="{{ route('author_posts', $post->author->username) }}" class="ml-1">{{ $post->author->name }} </a>
                </li>
            </ul>
        </article>
    </div>


    @endforeach

</div>
@else
<p><span class="text-danger">No posts found in this category</span></p>
@endif
<div class="pagination-block">
           {{ $posts->appends(request()->input())->links('custom_pagination') }}
         </div>
@endsection
