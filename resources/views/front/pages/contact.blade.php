@extends('front.layout.pages-layout')
@section('pageTitle', isset($pageTitle) ? $pageTitle : 'Document title')
@section('meta_tags')
    {!! SEO::generate() !!}
@endsection
@section('content')
    <div class="row">
        <div class="col-12">
            <div class="mb-5 d-flex align-items-center">
                <h3 class="title-color">Wasiliana nasi.</h3>
                <ul class="list-inline social-icons ml-auto mr-3 d-none d-sm-block">

                    @if (site_social_links()->facebook_url)
                        <li class="list-inline-item"><a href="{{ site_social_links()->facebook_url }}" target="_blank"><i
                                    class="ti-facebook"></i></a>
                        </li>
                    @endif

                    @if (site_social_links()->instagram_url)
                        <li class="list-inline-item"><a href="{{ site_social_links()->instagram_url }}" target="_blank"><i
                                    class="ti-instagram"></i></a>
                        </li>
                    @endif
                    @if (site_social_links()->linkedin_url)
                        <li class="list-inline-item"><a href="{{ site_social_links()->linked_url }}" target="_blank"><i
                                    class="ti-linkedin"></i></a>
                        </li>
                    @endif
                </ul>
            </div>
        </div>
        <div class="col-md-6">
            <div class="content mb-5">
                <h4>Tungependa kusikia kutoka kwako.</h4>
                <p>Purpose Reels imejengwa juu ya mshikamano, mazungumzo, na ukuaji wa pamoja.
                    Iwe una maoni, mawazo ya ushirikiano, au unataka tu kutusalimia, sauti yako ni ya muhimu hapa.</p>
                <h4 class="mt-5">Hupendi fomu? Tuandikie kupitia baruapepe</h4>
                <p><i class="ti-email mr-2 text-primary"></i><a
                        href="mailto:taarifa@purposereels.com">taarifa@purposereels.com</a>
                </p>
            </div>
        </div>
        <div class="col-md-6">
            <form method="POST" action="{{ route('send_email') }}">
                @csrf
                <x-form-alerts />
                <div class="form-group">
                    <label for="name"><b class="title-color">Jina lako</b> (Required):</label>
                    <input type="text" name="name" id="name" class="form-control" placeholder="eg: William Woods"
                        value="{{ old('name') }}">
                    @error('name')
                        <span class="text-danger ml-1">{{ $message }}</span>
                    @enderror
                </div>
                <div class="form-group">
                    <label for="email"> <b class="title-color">Anwani ya baruapepe</b> (Required): </label>
                    <input type="text" name="email" id="email" class="form-control"
                        placeholder="mf: williamwoods@mfano.com" value="{{ old('email') }}">
                    @error('email')
                        <span class="text-danger ml-1">{{ $message }}</span>
                    @enderror
                </div>
                <div class="form-group">
                    <label for="subject"><b class="title-color">Sababu</b>:</label>
                    <input type="text" name="subject" id="subject" class="form-control" placeholder="mf: Matangazo"
                        value="{{ old('subject') }}">
                    @error('subject')
                        <span class="text-danger ml-1">{{ $message }}</span>
                    @enderror
                </div>
                <div class="form-group">
                    <label for="message"><b class="title-color">Ujumbe wako</b>:</label>
                    <textarea name="message" id="message" class="form-control">{{ old('name') }}</textarea>
                    @error('message')
                        <span class="text-danger ml-1">{{ $message }}</span>
                    @enderror
                </div>
                <button type="submit" class="btn btn-primary">Tuma</button>
            </form>
        </div>
    </div>
@endsection
