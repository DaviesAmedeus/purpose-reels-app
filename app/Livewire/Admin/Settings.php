<?php

namespace App\Livewire\Admin;

use App\Models\GeneralSetting;
use Livewire\Component;
use App\Models\SiteSocialLink;

class Settings extends Component
{
    public $tab = null;
    public $default_tab = 'general_settings';
    protected $queryString = ['tab' => ['keep' => true]];

    // General settings form properties
    public $site_title, $site_email, $site_phone, $site_meta_keywords, $site_meta_description, $site_logo, $site_favicon;

    // Site social links properties
    public $facebook_url, $instagram_url, $linkedin_url;

    public function selectTab($tab)
    {
        $this->tab = $tab;
    }

    public function mount()
    {
        $this->tab = Request('tab') ? Request('tab') : $this->default_tab;

        // Populate General Settings for if there is data from theDB
        $settings = GeneralSetting::take(1)->first();

        // Populate Site social links
        $site_social_links = SiteSocialLink::take(1)->first();



        if (!is_null($settings)) {
            $this->site_title = $settings->site_title;
            $this->site_email = $settings->site_email;
            $this->site_phone = $settings->site_phone;
            $this->site_meta_keywords = $settings->site_meta_keywords;
            $this->site_meta_description = $settings->site_meta_description;
        }

        if (!is_null($site_social_links)) {
            $this->facebook_url = $site_social_links->facebook_url;
            $this->instagram_url = $site_social_links->instagram_url;
            $this->linkedin_url = $site_social_links->linkedin_url;
        }
    }

    public function updateSiteInfo()
    {
        $this->validate([
            'site_title' => 'required',
            'site_email' => 'required|email'
        ]);

        $settings = GeneralSetting::take(1)->first();
        $data = [
            'site_title' => $this->site_title,
            'site_email' => $this->site_email,
            'site_phone' => $this->site_phone,
            'site_meta_keywords' => $this->site_meta_keywords,
            'site_meta_description' => $this->site_meta_description
        ];

        if (!is_null($settings)) {
            $query = $settings->update($data);
        } else {
            $query = GeneralSetting::insert($data);
        }

        if ($query) {
            $this->dispatch('showToastr', ['type' => 'success', 'message' => 'General settings have been updated successfully!']);
        } else {
            $this->dispatch('showToastr', ['type' => 'error', 'message' => 'Something went wrong!']);
        }
    }

    public function updateSiteSocialLinks()
    {
        $this->validate([
            'facebook_url' => 'nullable|url',
            'instagram_url' => 'nullable|url',
            'linkedin_url' => 'nullable|url'
        ]);

        $site_social_links = SiteSocialLink::take(1)->first();
        $data = array('facebook_url' => $this->facebook_url,
            'instagram_url' => $this->instagram_url,
            'linkedin_url' => $this->linkedin_url);

        if (!is_null($site_social_links)) {
            $query = $site_social_links->update($data);
        } else {
            $query = SiteSocialLink::create($data);
        }

        if ($query) {
            $this->dispatch('showToastr', ['type' => 'success', 'message' => 'Site Social Links have been successfully updated']);
        } else {
            $this->dispatch('showToastr', ['type' => 'error', 'message' => 'Something went wrong!']);
        }
    }

    public function render()
    {
        return view('livewire.admin.settings');
    }
}
