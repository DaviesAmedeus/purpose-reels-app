<?php

namespace App\Livewire\Admin;

use Livewire\Component;
use Livewire\WithFileUploads;
use App\Models\Slide;

class Slides extends Component
{
    use WithFileUploads;

    public $isUpdateSlideMode = false;
    public $slide_id, $slide_heading, $slide_link, $slide_image, $slide_status = true;

    public function addSlide(){
        $this->slide_id = null;
        $this->slide_heading = null;
        $this->slide_link = null;
        $this->slide_image = null;
        $this->slide_status = true;
        $this->isUpdateSlideMode = false;
        $this->showSlideModalForm();
    }

    public function showSlideModalForm(){
        $this->resetErrorBag();
        $this->dispatch('showSlideModalForm');
    }

     public function hideSlideModalForm(){
        $this->dispatch('hideSlideModalForm');
        $this->isUpdateSlideMode = false;
        $this->slide_id= $this->slide_heading= $this->slide_link= $this->slide_image = null;
        $this->slide_status = true;
    }

    public function createSlide(){
        $this->validate([
            'slide_heading'=> 'required',
            'slide_link'=>'nullable|url',
            'slide_image'=>'required|mimes:png,jpg,jpeg,webp |max:2048'
        ]);

        $path = "slides/";
        $file = $this->slide_image;
        $filename = "SLD_".date('YmdHis', time()).'.'.$file->getClientOriginalExtension();

        // upload slide image
        $upload = $file->storeAs($path, $filename, 'slides_uploads');

        if(!$upload){
            $this->dispatch('showToastr', ['type'=>'error', 'message'=>'Something went wrong while uploading slide image']);
        }else{
            /**Store new slide */
            $slide = new Slide();
            $slide->image = $filename;
            $slide->heading =$this->slide_heading;
            $slide->link =$this->slide_link;
            $slide->status = $this->slide_status == true ? 1 : 0;
            $saved = $slide->save();

            if($saved){
                $this->hideSlideModalForm();
                $this->dispatch('showToastr', ['type'=>'success', 'message'=>'New Slide has been successfully added to database']);
            }else{
                $this->dispatch('showToastr', ['type'=>'error', 'message'=>'Something went wrong while save the slide details']);
            }

        }


    }

    public function render()
    {
        return view('livewire.admin.slides');
    }
}
