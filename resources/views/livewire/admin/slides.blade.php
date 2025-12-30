<div>
    <div class="page-header">
        <div class="row">
            <div class="col-md-6 col-sm-12">
                <div class="title">
                    <h4>Slider</h4>
                </div>
                <nav aria-label="breadcrumb" role="navigation">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item">
                            <a href="{{ route('admin.dashboard') }}">Home</a>
                        </li>
                        <li class="breadcrumb-item active" aria-current="page">
                            Slider
                        </li>
                    </ol>
                </nav>
            </div>
            <div class="col-md-6 col-sm-12 text-right">
                <a href="javascript:;" class="btn btn-primary" wire:click="addSlide()">
                    <i class="icon-copy bi bi-plus-circle mr-1"></i>Add Slide
                </a>
            </div>
        </div>
    </div>

    <div class="table-responsive">
        <table class="table table-striped table-auto table-sm table-condensed">
            <thead class="bg-secondary text-white">
                <th scope="col">#ID</th>
                <th scope="col">Image</th>
                <th scope="col">Heading</th>
                <th scope="col">Link</th>
                <th scope="col">Status</th>
                <th scope="col">Action</th>
            </thead>
            <tbody>
                <tr>
                    <td scope="row">#22</td>
                    <td>
                        <a href="#">
                            <img src="" width="100" alt="">
                        </a>
                    </td>
                    <td>Slide Heading</td>
                    <td>#Link</td>
                    <td>Status</td>
                    <td>
                        <div class="table-actions">
                            <a href="#" data-color="#265ed7" style="color: rgb(38, 94, 215)"><i
                                    class="icon-copy dw dw-edit2"></i>
                            </a>
                            <a href="#" data-color="#e95959" style="color: rgb(233, 89, 89)"><i
                                    class="icon-copy dw dw-delete-3"></i>
                            </a>
                        </div>
                    </td>
                </tr>
            </tbody>
        </table>
    </div>

    <!--SLIDE MODAL --->
    <div wire:ignore.self class="modal fade" id="slide_modal" tabindex="-1" role="dialog"
        aria-labelledby="myLargeModalLabel" aria-hidden="true" data-backdrop="static" data-keyboard="false">
        <div class="modal-dialog modal-dialog-centered">
            <form class="modal-content" wire:submit="{{ $isUpdateSlideMode ? 'updateSlide()' : 'createSlide()' }}">
                <div class="modal-header">
                    <h4 class="modal-title" id="myLargeModalLabel">
                        {{ $isUpdateSlideMode ? 'Update Slide' : 'Add Slide' }}
                    </h4>
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                        ×
                    </button>
                </div>
                <div class="modal-body">
                    @if ($isUpdateSlideMode)
                        <input type="hidden" wire:model="slide_id">
                    @endif
                    <div class="form-group">
                        <label for=""><b>Heading</b>:</label>
                        <input type="text" class="form-control" wire:model="slide_heading" placeholder="Enter Slide Heading">
                        @error('slide_heading')
                            <span class="text-danger ml-1">{{ $message }}</span>
                        @enderror
                    </div>

                    <div class="form-group">
                        <label for=""><b>Link</b>:</label>
                        <input type="text" class="form-control" wire:model="slide_link" placeholder="Enter Slide Link">
                        @error('slide_link')
                            <span class="text-danger ml-1">{{ $message }}</span>
                        @enderror
                    </div>

                    @if ($slide_image)
                        <div class="d-block" style="max-width: 200px;">
                            <img src="{{ $slide_image->temporaryUrl() }}" alt="" class="img-thumbnail" style="max-width: 100%;height:auto;">
                        </div>
                    @endif
                    <div class="form-group">
                        <label for=""><b>Image</b>:</label>
                        <input type="file" wire:model="slide_image" id="" class="form-control">
                        @error('slide_image')
                            <span class="text-danger ml-1">{{ $message }}</span>
                        @enderror
                    </div>
                    <div class="custom-control custom-checkbox mb-5">
                        {{-- <input type="check-box" class="custom-control-input" id="customCheck" checked wire:model="slide_status"> --}}
                        <input type="checkbox" checked class="form-check-input" id="customCheck">
                        <label for="customCheck">Visible on Slider</label>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">
                        Close
                    </button>
                    <button type="submit" class="btn btn-primary">
                        {{ $isUpdateSlideMode ? 'Save Changes' : 'Create' }}
                    </button>
                </div>
            </form>
        </div>
    </div>
    <!--/SLIDE MODAL -->
</div>
