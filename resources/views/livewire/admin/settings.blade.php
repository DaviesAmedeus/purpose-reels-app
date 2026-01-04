<div>
    <div class="tab">
        <ul class="nav nav-tabs customtab" role="tablist">
            <li class="nav-item">
                <a wire:click="selectTab('general_settings')"
                    class="nav-link {{ $tab == 'general_settings' ? 'active' : '' }}" data-toggle="tab"
                    href="#general_settings" role="tab" aria-selected="true">General settings</a>
            </li>
            <li class="nav-item">
                <a wire:click="selectTab('logo_favicon')" class="nav-link {{ $tab == 'logo_favicon' ? 'active' : '' }}"
                    data-toggle="tab" href="#logo_favicon" role="tab" aria-selected="false">Logo & Favicon</a>
            </li>
            <li class="nav-item">
                <a wire:click="selectTab('social_links')" class="nav-link {{ $tab == 'social_links' ? 'active' : '' }}"
                    data-toggle="tab" href="#social_links" role="tab" aria-selected="false">Social Links</a>
            </li>
        </ul>
        <div class="tab-content">
            <div class="tab-pane fade {{ $tab == 'general_settings' ? 'active show' : '' }}" id="general_settings"
                role="tabpanel">
                <div class="pd-20">
                    <form wire:submit="updateSiteInfo()">
                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label for="">Site title</label>
                                    <input type="text" class="form-control" wire:model="site_title"
                                        placeholder="Enter site title">
                                    @error('site_title')
                                        <span class="text-danger ml-1">{{ $message }}</span>
                                    @enderror
                                </div>
                            </div>

                            <div class="col-md-6">
                                <div class="form-group">
                                    <label for=""><b>Site email</b></label>
                                    <input type="text" class="form-control" wire:model="site_email"
                                        placeholder="Enter site email">
                                    @error('site_email')
                                        <span class="text-danger ml-1">{{ $message }}</span>
                                    @enderror
                                </div>
                            </div>

                            <div class="col-md-6">
                                <div class="form-group">
                                    <label for=""><b>Site phone
                                            number</b><span><small>(optional)</small></span></label>
                                    <input type="text" class="form-control" wire:model="site_phone"
                                        placeholder="Enter site phone number">
                                    @error('site_phone')
                                        <span class="text-danger ml-1">{{ $message }}</span>
                                    @enderror
                                </div>
                            </div>

                            <div class="col-md-6">
                                <div class="form-group">
                                    <label for=""><b>Site Meta Keywords</b><small>(optional)</small></label>
                                    <input type="text" class="form-control" wire:model="site_meta_keywords"
                                        placeholder="Eg: mafunzo, filamu, mafunzo katika filamu , purpose, purpose reels">
                                    @error('site_meta_keywords')
                                        <span class="text-danger ml-1">{{ $message }}</span>
                                    @enderror
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for=""><b>Site Meta Description</b><small>(optional)</small></label>
                            <textarea class="form-control" wire:model="site_meta_description" id="" cols="4" rows="4"
                                placeholder="Type site meta description..."></textarea>
                            @error('site_meta_description')
                                <span class="text-danger ml-1">{{ $message }}</span>
                            @enderror
                        </div>

                        <button type="submit" class="btn btn-primary">Save changes</button>
                    </form>
                </div>
            </div>

            <div class="tab-pane fade {{ $tab == 'logo_favicon' ? 'active show' : '' }}" id="logo_favicon"
                role="tabpanel">
                <div class="pd-20">
                    <div class="row">
                        <div class="col-md-6">
                            <h6>Site logo</h6>
                            <div class="mb-2 mt-1" style="max-width: 200px">
                                <img wire:ignore src="" alt="" class="img-thumbnail"
                                    data-ijabo-default-img="/images/site/{{ isset(settings()->site_logo) ? settings()->site_logo : '' }}"
                                    id="preview_site_logo">
                            </div>
                            <form action="{{ route('admin.update_logo') }}" method="post"
                                enctype="multipart/form-data" id="updateLogoForm">
                                @csrf
                                <div class="pb-5">
                                    <input type="file" name="site_logo" id="" class="form-control">
                                    <span class="text-danger ml-1"></span>
                                </div>
                                <button type="submit" class="btn btn-primary">Change logo</button>
                            </form>
                        </div>


                        <div class="col-md-6">
                            <h6>Site favicon</h6>
                            <div class="mb-2 mt-1" style="max-width: 200px">
                                <img wire:ignore src="" alt="" class="img-thumbnail"
                                    data-ijabo-default-img="/images/site/{{ isset(settings()->site_favicon) ? settings()->site_favicon : '' }}"
                                    id="preview_site_favicon">
                            </div>
                            <form action="{{ route('admin.update_favicon') }}" method="post"
                                enctype="multipart/form-data" id="updateFaviconForm">
                                @csrf
                                <div class="pb-5">
                                    <input type="file" name="site_favicon" id="" class="form-control">
                                    <span class="text-danger ml-1"></span>
                                </div>
                                <button type="submit" class="btn btn-primary">Change favicon</button>
                            </form>
                        </div>


                    </div>
                </div>
            </div>


            <div class="tab-pane fade {{ $tab == 'social_links' ? 'active show' : '' }}" id="social_links"
                role="tabpanel">
                <div class="pd-20">
                    <form wire:submit="updateSiteSocialLinks()">
                        <div class="row">
                            <div class="col-md-6">
                                <div class="mb-3">
                                    <label for=""><b>Facebook</b>:</label>
                                    <input type="text" wire:model="facebook_url" class="form-control"
                                        placeholder="Facebook URL">
                                    @error('facebook_url')
                                        <span class="text-danger ml-1">{{ $message }}</span>
                                    @enderror
                                </div>
                            </div>

                             <div class="col-md-6">
                                <div class="mb-3">
                                    <label for=""><b>Instagram</b>:</label>
                                    <input type="text" wire:model="instagram_url" class="form-control"
                                        placeholder="Instagram URL">
                                    @error('instagram_url')
                                        <span class="text-danger ml-1">{{ $message }}</span>
                                    @enderror
                                </div>
                            </div>

                             <div class="col-md-6">
                                <div class="mb-3">
                                    <label for=""><b>LinkedIn</b>:</label>
                                    <input type="text" wire:model="linkedin_url" class="form-control"
                                        placeholder="Linked URL">
                                    @error('linkedin_url')
                                        <span class="text-danger ml-1">{{ $message }}</span>
                                    @enderror
                                </div>
                            </div>

                        </div>
                <button class="btn btn-primary" type="submit"><b>Save changes</b></button>

                    </form>
                </div>
            </div>


        </div>
    </div>
</div>
