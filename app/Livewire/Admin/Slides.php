<?php

namespace App\Livewire\Admin;

use Livewire\Component;
use Livewire\WithFileUploads;
use App\Models\Slide;
use GrahamCampbell\ResultType\Success;
use Illuminate\Support\Facades\File;



class Slides extends Component
{
    use WithFileUploads;

    public $isUpdateSlideMode = false;
    public $slide_id, $slide_heading, $slide_link, $slide_image, $slide_status = true;
    public $selected_slide_image = null;

    protected $listeners = [
        'updateSlidesOrdering' => 'refresh',
        'deleteSlideAction',
        'displayMessage'
    ];

    public function updateSlideImage()
    {
        if ($this->slide_image) {
            $this->selected_slide_image = $this->slide_image->temporaryUrl();
        }
    }

    public function addSlide()
    {
        $this->slide_id = null;
        $this->slide_heading = null;
        $this->slide_link = null;
        $this->slide_image = null;
        $this->slide_status = true;
        $this->isUpdateSlideMode = false;
        $this->selected_slide_image = null;
        $this->showSlideModalForm();
    }

    public function showSlideModalForm()
    {
        $this->resetErrorBag();
        $this->dispatch('showSlideModalForm');
    }

    public function hideSlideModalForm()
    {
        $this->dispatch('hideSlideModalForm');
        $this->isUpdateSlideMode = false;
        $this->slide_id = $this->slide_heading = $this->slide_link = $this->slide_image = null;
        $this->slide_status = true;
    }

    public function createSlide()
    {
        $this->validate([
            'slide_heading' => 'required',
            'slide_link' => 'nullable|url',
            'slide_image' => 'required|mimes:png,jpg,jpeg,webp|max:2048'
        ]);

        $path = "slides/";
        $file = $this->slide_image;
        $filename = "SLD_" . date('YmdHis', time()) . '.' . $file->getClientOriginalExtension();

        // upload slide image
        $upload = $file->storeAs($path, $filename, 'slides_uploads');

        if (!$upload) {
            $this->dispatch('showToastr', ['type' => 'error', 'message' => 'Something went wrong while uploading slide image']);
        } else {
            /**Store new slide */
            $slide = new Slide();
            $slide->image = $filename;
            $slide->heading = $this->slide_heading;
            $slide->link = $this->slide_link;
            $slide->status = $this->slide_status == true ? 1 : 0;
            $saved = $slide->save();

            if ($saved) {
                $this->hideSlideModalForm();
                $this->dispatch('showToastr', ['type' => 'success', 'message' => 'New Slide has been successfully added to database']);
            } else {
                $this->dispatch('showToastr', ['type' => 'error', 'message' => 'Something went wrong while save the slide details']);
            }
        }
    }

    public function editSlide($id)
    {
        $slide = Slide::findOrFail($id);
        $this->slide_id = $slide->id;
        $this->slide_heading = $slide->heading;
        $this->slide_link = $slide->link;
        $this->slide_status = $slide->status == 1 ? true : false;
        $this->slide_image = null;
        $this->selected_slide_image = '/images/slides/' . $slide->image;
        $this->isUpdateSlideMode = true;
        $this->showSlideModalForm();
    }

    public function updateSlide()
    {
        $slide = Slide::findOrFail($this->slide_id);

        // validate the form
        $this->validate([
            'slide_heading' => 'required',
            'slide_link' => 'nullable|url',
            'slide_image' => 'nullable|mimes:png,jpg,jpeg,webp|max:2048',
        ]);

        $slide_image_name = $slide->image;

        // if form has image file
        if ($this->slide_image) {
            $path = 'slides/';
            $file = $this->slide_image;
            $filename = 'SLD_' . date('YmdHis', time()) . '.' . $file->getClientOriginalExtension();

            // Upload new Slide image
            $upload = $file->storeAs($path, $filename, 'slides_uploads');

            if (!$upload) {
                $this->dispatch('showToastr', ['type' => 'error', 'message' => 'Something went wrong while uploading s;ide image']);
            } else {
                // Delete old image
                $slide_path = 'images/' . $path;
                $old_slide_image = $slide->image;

                if ($old_slide_image != '' && File::exists(public_path($slide_path . $old_slide_image))) {
                    File::delete(public_path($slide_path . $old_slide_image));
                }
                $slide_image_name = $filename;
            }
        }

        // UPDATE SLIDE INFO
        $slide->image = $slide_image_name;
        $slide->heading = $this->slide_heading;
        $slide->link = $this->slide_link;
        $slide->status = $this->slide_status == true ? 1 : 0;
        $saved = $slide->save();

        if ($saved) {
            $this->hideSlideModalForm();
            $this->dispatch('showToastr', ['type' => 'success', 'message' => 'Slide has been succesfully updated']);
        } else {
            $this->dispatch('showToastr', ['type' => 'error', 'message' => 'Something went wrong wrong while updating slide info']);
        }
    }

    // public function updateSlidesOrdering($positions){
    //     foreach($positions as $position){
    //         $index = $position[0];
    //         $newPosition = $position[1];
    //         Slide::where("id",$index)->update([
    //             "ordering"=>$newPosition
    //         ]);
    //         $this->dispatch("showToastr", ["type"=>"success", "message"=>"Slides ordering have been updated!"]);

    //     }
    // }

    public function updateSlidesOrdering($positions)
    {
        logger($positions);
        foreach ($positions as $position) {
            Slide::where('id', $position[0])
                ->update(['ordering' => $position[1]]);
        }

        $this->dispatch('showToastr', [
            'type' => 'success',
            'message' => 'Slides ordering updated successfully!'
        ]);
    }
    public function deleteSlideAction($id)
    {
        $slide = Slide::findOrFail($id);
        $path = "slides/";
        $slide_path = "images/" . $path;
        $slide_image = $slide->image;

        if ($slide_image != '' && File::exists(public_path($slide_path . $slide_image))) {
            File::delete(public_path($slide_path . $slide_image));
        }

        $delete = $slide->delete();
        if ($delete) {
            $this->dispatch('showToastr', ['type' => 'success', 'message' => 'Slide has been deleted successfully!']);
        } else {
            $this->dispatch('showToastr', ['type' => 'error', 'message' => 'Something went wrong while deleting slide info!']);
        }
    }

    public function displayMessage()
    {
        $this->dispatch('showToastr', ['type' => 'success', 'message' => 'Slide has been deleted successfully!']);
    }
    public function render()
    {
        return view('livewire.admin.slides', ['slides' => Slide::orderBy('ordering', 'asc')->get()]);
    }
}
