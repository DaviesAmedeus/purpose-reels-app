<?php

namespace App\Livewire;

use Livewire\Component;
use App\Models\NewsLetterSubscriber;


class NewsletterForm extends Component
{
    public $email = '';

    // Define validation rules
    protected $rules = [
        'email'=>'required|email|unique:news_letter_subscribers,email',
    ];

    // Define custom error messages
    protected function message(){
        return [
            'email.required'=>'Please enter your email address',
            'email.email'=>'Please provide a valid email address',
            'email.unique'=>'This email is already subscribed. Please use another one'
        ];
    }

    // Real -time validation method
    public function updateEmail(){
        $this->validateOnly('email');
    }

    public function subscribe(){
        // Validate the email before processing the subscription
        $this->validate();

        // Save email into DB
        NewsLetterSubscriber::create(['email'=>$this->email]);

        // Clear input and notify the user
        $this->email = '';
        // $this->dispatch('showToastr', ['type'=>'error', 'message'=>'You have successfully subscribded to our newsletter']);
        $this->dispatch('showToastr', ['type' => 'success', 'message' => 'Slide has been deleted successfully!']);
    }

    public function render()
    {
        return view('livewire.newsletter-form');
    }
}
