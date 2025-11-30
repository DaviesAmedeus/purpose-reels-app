@extends('back.layout.pages-layout')
@section('pageTitle', isset($pageTitle) ? $pageTitle : 'Page Title Here')

@section('content')
    <div class="row mb-4">
        <div class="col-12">
            <div class="pd-20 card-box p-5">
                <div class="clearFix">
                    <div class="pull-left">
                        <h4 class="h4 text-blue">Parent categories</h4>
                    </div>
                    <div class="pull-right">
                        <a class="btn btn-primary btn-sm text-light">Add P. Category</a>
                    </div>
                </div>

                <div class="table-responsive mt-5">
                    <table class="table table-borderless table-striped table-sm">
                        <thead class="bg-secondary text-white">
                            <th>#</th>
                            <th>Name</th>
                            <th>N . of categories</th>
                            <th>Actions</th>
                        </thead>

                        <tbody>
                            <tr>
                                <td>1</td>
                                <td>P. Cat 1</td>
                                <td>4</td>
                                <td>
                                    <div class="table-actions">
                                        <a class="text-primary mx-2">
                                            <i class="dw dw-edit2"></i>
                                        </a>
                                        <a class="text-danger mx-2">
                                            <i class="dw dw-delete-3"></i>
                                        </a>
                                    </div>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>

            </div>
        </div>

        <div class="col-12 mt-5">
            <div class="pd-20 card-box p-5">
                <div class="clearFix">
                    <div class="pull-left">
                        <h4 class="h4 text-blue">Categories</h4>
                    </div>
                    <div class="pull-right">
                        <a class="btn btn-primary btn-sm text-light">Add category</a>
                    </div>
                </div>

                <div class="table-responsive mt-5">
                    <table class="table table-borderless table-striped table-sm">
                        <thead class="bg-secondary text-white">
                            <th>#</th>
                            <th>Name</th>
                            <th>Parent category</th>
                            <th>N . of posts</th>
                            <th>Actions</th>
                        </thead>

                        <tbody>
                            <tr>
                                <td>1</td>
                                <td>P. Cat 1</td>
                                <td>Any</td>
                                <td>4</td>
                                <td>
                                    <div class="table-actions">
                                        <a class="text-primary mx-2">
                                            <i class="dw dw-edit2"></i>
                                        </a>
                                        <a class="text-danger mx-2">
                                            <i class="dw dw-delete-3"></i>
                                        </a>
                                    </div>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>

            </div>
        </div>
    </div>
@endsection
