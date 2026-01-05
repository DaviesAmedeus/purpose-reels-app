@extends('front.layout.pages-layout')
{{-- @section('pageTitle', isset($pageTitle) ? $pageTitle : 'Document title') --}}
@section('meta_tags')
    {!! SEO::generate() !!}
@endsection
@section('content')
    <div class="row">
        <div class="col-12">
            <div class="mb-5 d-flex align-items-center">
                <h3 class="title-color">Kuhusu Purpose Reels</h3>
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
            <img src="./images/posts/10.png" class="img-fluid w-100 mb-4 rounded-lg" alt="author">
            <div class="content">
                <p>Purpose Reels ni jukwaa la ubunifu linalotumia nguvu ya filamu kusimulia hadithi zenye maana na kutoa
                    mafunzo ya maisha yanayochochea ukuaji binafsi, tafakari, na kuishi kwa kusudi. Purpose Reels huangazia
                    filamu kama nyenzo ya kujifunza, si burudani pekee. Kupitia uchambuzi wa kina wa filamu mbalimbali,
                    tunatoa mafunzo yanayogusa maisha halisi—mafunzo kuhusu nidhamu, ujasiri, uongozi, imani, uvumilivu, na
                    mwelekeo wa maisha.</p>


                <h4>Dhamira yetu</h4>
                <p>Dhamira ya Purpose Reels ni kusaidia watu kugundua na kuimarisha kusudi lao kwa kutumia simulizi za
                    filamu kama kioo cha kujitafakari na kukua. Tunaamini kila hadithi ina somo, na kila somo lina uwezo wa
                    kubadilisha maisha.</p>


                <h4>Kwanini filamu?</h4>
                <p>Filamu zina nguvu ya kipekee ya kugusa hisia na kufikisha ujumbe kwa namna rahisi lakini ya kina. Purpose
                    Reels hutumia filamu kama daraja kati ya burudani na elimu, kusaidia watazamaji kuona maisha yao kupitia
                    macho mapya.</p>

                <h4>Purpose Reels ni kwaajili ya nani?</h4>
                <ul>
                    <li>Wapenzi wa filamu wanaotafuta maana zaidi ya burudani</li>
                    <li>Vijana na watu wazima wanaotamani kukua binafsi</li>
                    <li>Watafuta motisha, mwelekeo, na msukumo wa maisha</li>
                    <li>Jamii inayothamini mazungumzo yenye maana na ukuaji wa pamoja</li>
                </ul>

                <h4>Unachoweza kupata kupitia Purpose Reels</h4>
                <ul>
                    <li>Unachoweza Kupata Kupitia Purpose Reels</li>
                    <li>Mafunzo ya maisha yanayotokana na filamu</li>
                    <li>Maudhui ya kuhamasisha na kutafakari</li>
                    <li>Uchambuzi wa filamu kwa mtazamo wa kusudi na thamani</li>
                    <li>Jamii inayojifunza na kukua pamoja</li>
                </ul>

                <h4>Mwaliko wetu kwako</h4>
                <p>Purpose Reels si ukurasa wa kutazama tu—ni mwaliko wa kuanza safari ya kujitambua na kukua. Tunakukaribisha kushiriki mawazo yako, kujifunza nasi, na kuwa sehemu ya jamii inayogeuza filamu kuwa mafunzo ya maisha.</p>
            </div>
        </div>
    </div>
@endsection
