<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>Password Changed</title>
  <style>
    body {
      margin: 0;
      padding: 0;
      font-family: Arial, sans-serif;
      background-color: #f5f5f5;
    }

    .container {
      max-width: 600px;
      margin: 20px auto;
      background: #ffffff;
      padding: 20px;
      border-radius: 8px;
    }

    h2 {
      color: #333333;
    }

    .details {
      background: #f0f0f0;
      padding: 15px;
      border-radius: 6px;
      margin-top: 15px;
    }

    .footer {
      text-align: center;
      color: #777777;
      font-size: 12px;
      margin-top: 20px;
    }

    @media (max-width: 480px) {
      .container {
        padding: 15px;
      }
      .details {
        font-size: 14px;
      }
    }
  </style>
</head>

<body>
  <div class="container">
    <h2>Password Changed Successfully</h2>
    <p>Hello, <strong>{{ $user->name }}</strong> </p>
    <p>Your password has been changed successfully. Below are your updated login details:</p>

    <div class="details">
      <p><strong>Email:</strong> {{$user->email}} or <strong>Username:</strong> {{$user->username}}</p>
      <p><strong>New Password:</strong> {{$new_password}}</p>
    </div>

    <p>If you did not request this change, please contact support immediately.</p>

    <div class="footer">
     &copy; {{date('Y')}} PURPOSE REELS. All rights reserved.
    </div>
  </div>
</body>
</html>
