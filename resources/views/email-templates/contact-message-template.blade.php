<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>New Contact Form Message</title>
</head>
<body style="margin:0; padding:0; background-color:#f4f4f4; font-family:Arial, Helvetica, sans-serif;">

    <table width="100%" cellpadding="0" cellspacing="0" style="background-color:#f4f4f4; padding:20px;">
        <tr>
            <td align="center">
                <table width="600" cellpadding="0" cellspacing="0" style="background-color:#ffffff; border-radius:6px; overflow:hidden;">

                    <!-- Header -->
                    <tr>
                        <td style="background-color:#2c3e50; color:#ffffff; padding:16px 20px;">
                            <h2 style="margin:0; font-size:18px;">New Contact Form Message</h2>
                        </td>
                    </tr>

                    <!-- Body -->
                    <tr>
                        <td style="padding:20px; color:#333333;">
                            <p style="margin:0 0 10px;">You have received a new message from your website contact form.</p>

                            <table width="100%" cellpadding="0" cellspacing="0" style="margin-top:15px;">
                                <tr>
                                    <td style="padding:8px 0; font-weight:bold; width:120px;">Name:</td>
                                    <td style="padding:8px 0;">{{$name}}</td>
                                </tr>
                                <tr>
                                    <td style="padding:8px 0; font-weight:bold;">Email:</td>
                                    <td style="padding:8px 0;">{{$email}}</td>
                                </tr>
                                <tr>
                                    <td style="padding:8px 0; font-weight:bold;">Subject:</td>
                                    <td style="padding:8px 0;">{{$subject}}</td>
                                </tr>
                                <tr>
                                    <td style="padding:8px 0; font-weight:bold; vertical-align:top;">Message:</td>
                                    <td style="padding:8px 0; white-space:pre-line;">
                                        {{$message}}
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>

                    <!-- Footer -->
                    <tr>
                        <td style="background-color:#f0f0f0; padding:12px 20px; font-size:12px; color:#666666;">
                            <p style="margin:0;">
                                This email was sent from your website contact form.
                            </p>
                        </td>
                    </tr>

                </table>
            </td>
        </tr>
    </table>

</body>
</html>
