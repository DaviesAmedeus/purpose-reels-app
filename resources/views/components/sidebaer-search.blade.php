<div>
    <div class="widget">
        <h5 class="widget-title"><span>Search</span></h5>
        <form action="{{ route('search_posts') }}" method="GET" class="widget-search">
            <input id="search-query" name="q" type="search"
                placeholder="Andika kupata mafunzo, makala &amp; simulizi mba..." value="{{ request('q') ? request('q ') : '' }}">
            <button type="submit"><i class="ti-search"></i>
            </button>
        </form>
    </div>
</div>
