--[[
    index.html.lua  —  organised by minimarchbleeding
    Original : Drop56796/Web  ->  index.html
    Not obfuscated; reproduced as-is.
--]]

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Create API Link</title>
    <link rel="stylesheet" href="{{ url_for('static', filename='a.css') }}">
</head>
<body>
    <div class="container">
        <h1>Create API Link</h1>
        <form method="POST">
            <label for="title">Title:</label>
            <input type="text" id="title" name="title" required>
            
            <label for="link_description">Link Description:</label>
            <input type="text" id="link_description" name="link_description" required>
            
            <label for="destination">Destination:</label>
            <input type="text" id="destination" name="destination" required>
            
            <label for="f_domain">Domain:</label>
            <input type="text" id="f_domain" name="f_domain" required>
            
            <label for="custom">Custom URL Ending:</label>
            <input type="text" id="custom" name="custom" required>
            
            <label for="youtube_video_id">YouTube Video ID:</label>
            <input type="text" id="youtube_video_id" name="youtube_video_id">
            
            <label for="api_key">API Key:</label>
            <input type="text" id="api_key" name="api_key" required>
            
            <button type="submit">Create Link</button>
        </form>
        {% with messages = get_flashed_messages(with_categories=true) %}
          {% if messages %}
            <ul class="messages">
              {% for category, message in messages %}
                <li class="{{ category }}">{{ message }}</li>
              {% endfor %}
            </ul>
          {% endif %}
        {% endwith %}
    </div>
</body>
</html>
