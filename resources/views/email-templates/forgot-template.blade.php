<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <title>Reset your password</title>
    <style>
      /* General resets */
      body,table,td { font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, 'Helvetica Neue', Arial, sans-serif; }
      img { border: 0; -ms-interpolation-mode: bicubic; }
      a { color: #1a73e8; text-decoration: none; }

      /* Container */
      .email-wrapper { width: 100%; background-color: #f4f6f8; padding: 20px 0; }
      .email-content { width: 100%; max-width: 600px; margin: 0 auto; }

      /* Card */
      .card { background: #ffffff; border-radius: 8px; overflow: hidden; }
      .card-body { padding: 28px; }

      /* Header */
      .brand { display: block; text-align: left; padding: 20px 28px; }
      .brand img { height: 36px; }

      h1 { font-size: 20px; margin: 0 0 8px; }
      p { margin: 0 0 16px; color: #394249; line-height: 1.5; }

      /* Button */
      .btn { display: inline-block; padding: 12px 20px; border-radius: 6px; background-color: #1a73e8; color: #ffffff; font-weight: 600; }

      /* Footer */
      .help { font-size: 13px; color: #6b7280; }

      /* Mobile */
      @media only screen and (max-width: 480px) {
        .card-body { padding: 18px; }
        h1 { font-size: 18px; }
      }
    </style>
  </head>
  <body style="margin:0;padding:0;">

    <!-- Preview text (shown in inbox preview) -->
    <span style="display:none;visibility:hidden;mso-hide:all;font-size:1px;line-height:1px;max-height:0;max-width:0;opacity:0;overflow:hidden;">Use this link to reset your password — it expires in 1 hour.</span>

    <table class="email-wrapper" role="presentation" cellspacing="0" cellpadding="0" width="100%">
      <tr>
        <td align="center">

          <table class="email-content" role="presentation" cellspacing="0" cellpadding="0" width="100%">

            <!-- Brand / Header -->
            <tr>
              <td class="brand">
                <!-- Replace with your logo -->
                <img src="https://via.placeholder.com/150x36?text=LOGO" alt="Company Logo" style="display:block;">
              </td>
            </tr>

            <!-- Card -->
            <tr>
              <td>
                <table class="card" role="presentation" cellspacing="0" cellpadding="0" width="100%">
                  <tr>
                    <td class="card-body">
                      <h1>Password reset request</h1>
                      <p>Hi {{$user->name}},</p>
                      <p>We received a request to reset the password for your account. Click the button below to choose a new password.</p>

                      <p style="text-align:center;margin:22px 0;">
                        <!-- Button fallback link goes in href (use full absolute URL) -->
                        <a href="{{$actionLink}}" target="_blank" class="btn">Reset password</a>
                      </p>



                      <hr style="border:none;border-top:1px solid #e6e9ee;margin:20px 0;">

                      <p class="help">If you didn't request a password reset, you can safely ignore this email. If you have questions, reply to this email or contact the support team</p>

                      <p style="margin-top:18px;font-size:13px;color:#9aa0a6;">Thanks —<br>Purpose Reels Team</p>

                    </td>
                  </tr>
                </table>
              </td>
            </tr>

            <!-- Footer -->
            <tr>
              {{-- <td style="padding:18px 0 0; text-align:center; font-size:12px; color:#9aa0a6;">
                <p style="margin:0;">{{company_name}} • {{company_address}}</p>
                <p style="margin:6px 0 0;">If you'd like to unsubscribe from these emails, <a href="{{unsubscribe_link}}">click here</a>.</p>
              </td>
            </tr> --}}

          </table>

        </td>
      </tr>
    </table>

  </body>
</html>
