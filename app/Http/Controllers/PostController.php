<?php

namespace App\Http\Controllers;

use App\Models\Post;
use App\Models\Category;
use Illuminate\Http\Request;
use Intervention\Image\Facades\Image;
use App\Models\ParentCategory;
use Illuminate\Support\Facades\File;

class PostController extends Controller
{
    public function addPost(Request $request)
    {
        $categories_html = '';
        $pcategories = ParentCategory::whereHas('children')->orderBy('name', 'asc')->get();
        $categories = Category::where('parent', 0)->orderBy('name', 'asc')->get();

        if (count($pcategories) > 0) {
            foreach ($pcategories as $item) {
                $categories_html .= '<optgroup label="' . $item->name . '">';
                foreach ($item->children as $category) {
                    $categories_html .= '<option value="' . $category->id . '">' . $category->name . '</option>';
                }
                $categories_html .= '</optgroup>';
            }
        }

        if (count($categories) > 0) {
            foreach ($categories as $item) {
                $categories_html .= '<option value="' . $item->id . '">' . $item->name . '</option>';
            }
        }

        $data = [
            'pageTitle' => 'Add new post',
            'categories_html' => $categories_html
        ];

        return view('back.pages.add_post', $data);
    }


    public function createPost(Request $request)
    {
        $request->validate([
            'title' => 'required|unique:posts,title',
            'content' => 'required',
            'category' => 'required|exists:categories,id',
            'featured_image' => 'required|mimes:png,jpg,jpeg|max:1024'
        ]);


        // create post
        if ($request->hasFile('featured_image')) {
            $path = "images/posts/";
            $file = $request->file('featured_image');
            $filename = $file->getClientOriginalName();
            $new_filename = time() . '_' . $filename;

            // upload the featured image
            $upload = $file->move(public_path($path), $new_filename);

            if ($upload) {
                /**Generate resized image & thumbnail */
                $resized_path = $path . 'resized/';
                if (!File::isDirectory($resized_path)) {
                    File::makeDirectory($resized_path, 0777, true, true);
                }

                // Thumbnail (aspect ratio: 1)
                Image::make($path . $new_filename)
                    ->fit(250, 250)
                    ->save($resized_path . 'thumb_' . $new_filename);

                // Resized Image (Aspect ratio: 1.6)
                Image::make($path . $new_filename)
                    ->fit(512, 320)
                    ->save($resized_path . 'resized_' . $new_filename);

                $post = new Post();
                $post->author_id = auth()->id();
                $post->category = $request->category;
                $post->title = $request->title;
                $post->content = $request->content;
                $post->featured_image = $new_filename;
                $post->tags = $request->tags;
                $post->meta_keywords = $request->meta_keywords;
                $post->meta_description = $request->meta_description;
                $post->visibility = $request->visibility;
                $saved = $post->save();

                if ($saved) {
                    return response()->json(['status' => 1, 'message' => 'New post has been created successfully!']);
                } else {
                    return response()->json(['status' => 0, 'message' => 'Something went wromg!']);
                }
            } else {
                return response()->json(['status' => 0, 'message' => 'Something went wrong on uploading  a featured image']);
            }
        }
    }


    public function allPosts(Request $request)
    {
        $data = [
            'pageTitle' => 'Posts'
        ];
        return view('back.pages.posts', $data);
    }

    public function editPost(Request $request, $id = null)
    {
        $post = Post::findOrFail($id);

        $categories_html = '';
        $pcategories = ParentCategory::whereHas('children')->orderBy('name', 'asc')->get();
        $categories = Category::where('parent', 0)->orderBy('name', 'asc')->get();

        if (count($pcategories) > 0) {
            foreach ($pcategories as $item) {
                $categories_html .= '<optgroup label="' . $item->name . '">';
                foreach ($item->children as $category) {
                    $selected = $category->id == $post->category ? 'selected' : '';
                    $categories_html .= '<option value="' . $category->id . '" ' . $selected . '>' . $category->name . '</option>';
                }
                $categories_html .= '</optgroup>';
            }
        }

        if (count($categories) > 0) {
            foreach ($categories as $item) {
                $selected = $item->id == $post->category ? 'selected' : '';
                $categories_html .= '<option value="' . $item->id . '" ' . $selected . '>' . $item->name . '</option>';
            }
        }

        $data = [
            'pageTitle' => 'Edit',
            'post' => $post,
            'categories_html' => $categories_html
        ];

        return view('back.pages.edit_post', $data);
    }

    public function updatePost(Request $request)
    {
        $post = Post::findOrFail($request->post_id);
        $featured_image_name = $post->featured_image;

        // Validate form
        $request->validate([
            'title' => 'required|unique:posts,title,' . $post->id,
            'content' => 'required',
            'category' => 'required|exists:categories,id',
            'featured_image' => 'nullable|mimes:jpeg,jpg,png|max:1024'

        ]);

        if ($request->hasFile('featured_image')) {
            $old_featured_image = $post->featured_image;
            $path = 'images/posts/';
            $file = $request->file('featured_image');
            $filename = $file->getClientOriginalName();
            $new_filename = time() . '_' . $filename;

            // upload a new featured image
            $upload = $file->move(public_path($path), $new_filename);

            if ($upload) {

                /**Generate resized image & thumbnail */
                $resized_path = $path . 'resized/';

                // Thumbnail (aspect ratio: 1)
                Image::make($path . $new_filename)
                    ->fit(250, 250)
                    ->save($resized_path . 'thumb_' . $new_filename);

                // Resized Image (Aspect ratio: 1.6)
                Image::make($path . $new_filename)
                    ->fit(512, 320)
                    ->save($resized_path . 'resized_' . $new_filename);

                // Deleting old featured image
                if ($old_featured_image != null && File::exists(public_path($path . $old_featured_image))) {
                    File::delete(public_path($path . $old_featured_image));

                    // Delete resized image
                    if (File::exists(public_path($resized_path . 'resized_' . $old_featured_image))) {
                        File::delete(public_path($resized_path . 'resized_' . $old_featured_image));
                    }

                    // Delete thumbnail image
                    if (File::exists(public_path($resized_path . 'thumb_' . $old_featured_image))) {
                        File::delete(public_path($resized_path . 'thumb_' . $old_featured_image));
                    }
                }

                $featured_image_name = $new_filename;
            } else {
                return response()->json(['status' => 0, 'message' => 'Something went wrong while uploading the featured image']);
            }
        }
        //UPDATING post data in database
        $post->category = $request->category;
        $post->title = $request->title;
        $post->slug = null;
        $post->content = $request->content;
        $post->featured_image = $featured_image_name;
        $post->tags = $request->tags;
        $post->meta_keywords = $request->meta_keywords;
        $post->meta_description = $request->meta_description;
        $post->visibility = $request->visibility;
        $saved = $post->save();

        if($saved){
            return response()->json(['status'=>1, 'message'=>'Blog post was updated successfully!']);
        }else{
                        return response()->json(['status'=>0, 'message'=>'Something went wrong while updating the blog post']);

        }
    }
}
