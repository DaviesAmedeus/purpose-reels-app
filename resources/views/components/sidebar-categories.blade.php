<div>
    <div class="widget">
        <h5 class="widget-title"><span>Categories</span></h5>
        <ul class="list-unstyled widget-list">
            <li>
                @foreach (sidebar_categories() as $item)
                    <a href="{{ route('category_posts', $item->slug) }}" class="d-flex">{{ $item->name }}
                        <small class="ml-auto">({{ $item->posts->count() }})</small></a>
                    <hr>
                @endforeach
            </li>


        </ul> 
    </div>
</div>
