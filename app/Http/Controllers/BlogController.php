<?php

namespace App\Http\Controllers;

use App\Models\Post;
use App\Models\Category;
use Illuminate\Http\Request;
use Artesaos\SEOTools\Facades\SEOMeta;
use Artesaos\SEOTools\Facades\SEOTools;

class BlogController extends Controller
{
    public function index(){
        $title = isset(settings()->site_title) ? settings()->site_title : '';
        $description = isset(settings()->site_meta_description) ? settings()->site_meta_description : '';
        $imgURL = isset(settings()->site_logo) ? asset('/images/site/'.settings()->site_logo) : '';
        $keywords = isset(settings()->site_meta_keywords) ? settings()->site_meta_keywords : '';
        $currentUrl = url()->current();

        /**Meta SEO */
        SEOTools::setTitle($title, false);
        SEOTools::setDescription($description);
        SEOMeta::setKeywords($keywords);

        /**Open Graph */
        SEOTools::opengraph()->setUrl($currentUrl);
        SEOTools::opengraph()->addImage($imgURL);
        SEOTools::opengraph()->addProperty('type', 'articles');

        /** Twitter */
        SEOTools::twitter()->addImage($imgURL);
        SEOTools::twitter()->setUrl($currentUrl);
        SEOTools::twitter()->setSite ('@purpose_reels');


        $data = ['pageTitle'=>$title];
        return view('front.pages.index', $data);
    }


    public function categoryPosts(Request $request, $slug=null){
        // Find Category by slug
        $category = Category::where('slug',$slug)->firstOrFail();

        // Retrieve posts related to this category and paginate
        $posts = Post::where('category', $category->id)->paginate(8);

        $title = 'Posts in Category'.$category->name;
        $description = 'Browse the latest posts in the '.$category->name.' category. Stay updated!';

        /**Set SEO Meta Tags */
        SEOTools::setTitle($title,false);
        SEOTools::setDescription($description);
        SEOTools::opengraph()->setUrl(url()->current());

        $data = [
            'pageTitle'=> $category->name,
            'posts'=>$posts
        ];
        return view('front.pages.category_posts', $data);
    }
}
