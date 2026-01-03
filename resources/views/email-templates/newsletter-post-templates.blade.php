<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>New Blog Post</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <style>
        body {
            margin: 0;
            padding: 0;
            background-color: #f4f4f4;
            font-family: Arial, Helvetica, sans-serif;
        }
        table {
            border-collapse: collapse;
        }
        img {
            display: block;
            max-width: 100%;
            height: auto;
        }
        .container {
            max-width: 600px;
            width: 100%;
            background-color: #ffffff;
            margin: 0 auto;
        }
        .content {
            padding: 20px;
        }
        .post-title {
            font-size: 22px;
            font-weight: bold;
            color: #333333;
            margin-bottom: 10px;
        }
        .post-description {
            font-size: 15px;
            line-height: 1.6;
            color: #555555;
            margin-bottom: 20px;
        }
        .btn {
            display: inline-block;
            padding: 12px 20px;
            background-color: #1a73e8;
            color: #ffffff;
            text-decoration: none;
            font-size: 15px;
            border-radius: 4px;
        }
        .footer {
            padding: 15px;
            text-align: center;
            font-size: 12px;
            color: #888888;
            background-color: #fafafa;
        }

        @media screen and (max-width: 600px) {
            .content {
                padding: 15px;
            }
            .post-title {
                font-size: 20px;
            }
        }
    </style>
</head>
<body>

<table width="100%" cellpadding="0" cellspacing="0">
    <tr>
        <td align="center">
            <table class="container" cellpadding="0" cellspacing="0">

                <!-- Post Image -->
                <tr>
                    <td>
                        <a href="{{ route('read_post',$post->slug) }}">
                            <img src="{{ asset('images/slides/' . $post->image) }}" alt="{{ $post->slug }}">
                        </a>
                    </td>
                </tr>

                <!-- Content -->
                <tr>
                    <td class="content">
                        <div class="post-title">
                            {{ $post->title }}
                        </div>

                        <div class="post-description">
                            {!! Str::ucfirst(words($post->content, 43)) !!}
                        </div>

                        <a href="{{ route('read_post',$post->slug) }}" class="btn">
                            Read Full Article
                        </a>
                    </td>
                </tr>

                <!-- Footer -->
                <tr>
                    <td class="footer">
                        You’re receiving this email because you subscribed to our blog.<br>
                        © {{ date("Y")  }} Your Website Name
                    </td>
                </tr>

            </table>
        </td>
    </tr>
</table>

</body>
</html>
