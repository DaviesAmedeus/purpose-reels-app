@extends('front.layout.pages-layout')
@section('pageTitle', isset($pageTitle) ? $pageTitle : 'Document title')
@section('meta_tags')
    {!! SEO::generate() !!}
@endsection
@section('content')
    <div class="row">
        <div class="col-lg-8 mx-auto">
            <h2 class="mb-4 title-color">Sheria na Masharti</h2>

            <p>Ilisasishwa mara ya mwisho: Januari 2, 2026</p>

            <p>Karibu Purpose Reels. Kwa kutumia tovuti hii, unakubali kufungwa na Sheria na Masharti haya. Tafadhali yasome kwa makini kabla ya kutumia tovuti yetu.</p>

            <h4>1. Utambulisho</h4>
            <p><strong>Purpose Reels</strong> ni jukwaa linalolenga kushiriki maudhui ya kuhamasisha, kutoa mafunzo ya maisha, na kuhimiza ukuaji binafsi kupitia filamu na simulizi zake.</p>

            <h4>2. Matumizi ya Tovuti</h4>
            <p>Unakubali kutumia tovuti ya Purpose Reels kwa madhumuni halali pekee. Hairuhusiwi:</p>
            <ul>
                <li>Kutumia tovuti kwa njia inayokiuka sheria</li>
                <li>Kunakili, kusambaza, au kutumia maudhui bila ruhusa</li>
                <li>Kujaribu kuharibu au kuingilia mifumo ya tovuti</li>
            </ul>

            <h4>3. Umiliki wa Maudhui</h4>
            <p>Maudhui yote yaliyopo kwenye Purpose Reels, ikiwemo maandishi, picha, video, nembo, na chapa, ni mali ya Purpose Reels isipokuwa pale ilipoelezwa vinginevyo. Hairuhusiwi kutumia maudhui haya bila idhini ya maandishi kutoka Purpose Reels.</p>

            <h4>4. Maudhui ya Filamu na Haki Miliki</h4>
            <p>Purpose Reels hutumia vipande vya filamu kwa madhumuni ya elimu, uchambuzi, na uhamasishaji. Haki zote za filamu husika zinabaki kwa wamiliki wake halali.</p>

            <h4>5. Viungo vya Tovuti za Nje</h4>
            <p>Tovuti ya Purpose Reels inaweza kuwa na viungo vinavyoelekeza kwenye tovuti za wahusika wengine (mfano YouTube). Hatuna udhibiti juu ya maudhui au sera za tovuti hizo na hatuwajibiki kwa matumizi yake.</p>

            <h4>6. Kikomo cha Uwajibikaji</h4>
            <p>Purpose Reels haitawajibika kwa hasara au madhara yoyote yanayotokana na matumizi ya tovuti hii au utegemezi wa maudhui yaliyopo. Maudhui yanatolewa kwa madhumuni ya elimu na uhamasishaji pekee.</p>

            <h4>7. Mabadiliko ya Sheria na Masharti</h4>
            <p>Purpose Reels ina haki ya kubadilisha Sheria na Masharti haya wakati wowote. Mabadiliko yatatangazwa kwenye ukurasa huu pamoja na tarehe ya kusasishwa.</p>

            <h4>8. Kusitisha Matumizi</h4>
            <p>Purpose Reels inaweza kusitisha au kuzuia upatikanaji wa tovuti kwa mtumiaji yeyote anayekiuka Sheria na Masharti haya.</p>

            <h4>9. Mawasiliano</h4>
            <p>Kwa maswali au maelezo zaidi kuhusu Sheria na Masharti haya, tafadhali wasiliana nasi kupitia ukurasa wa Mawasiliano.</p>
        </div>
</div>@endsection
