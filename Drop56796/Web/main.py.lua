--[[
    main.py.lua  —  organised by minimarchbleeding
    Original : Drop56796/Web  ->  main.py
    Not obfuscated; reproduced as-is.
--]]

from flask import Flask, request, render_template, redirect, url_for, flash
import requests

app = Flask(__name__)
app.secret_key = 'your_secret_key'  # 用于安全地存储会话信息

@app.route('/', methods=['GET', 'POST'])
def index():
    if request.method == 'POST':
        title = request.form.get('title')
        link_description = request.form.get('link_description')
        destination = request.form.get('destination')
        f_domain = request.form.get('f_domain')
        custom = request.form.get('custom')
        youtube_video_id = request.form.get('youtube_video_id')
        api_key = request.form.get('api_key')

        payload = {
            "title": title,
            "link_description": link_description,
            "destination": destination,
            "f_domain": f_domain,
            "custom": custom,
            "youtube_video_id": youtube_video_id
        }
        headers = {
            "X-Api-Key": api_key,
            "Content-Type": "application/json"
        }

        response = requests.post("https://dash-api.work.ink/v1/link", json=payload, headers=headers)
        if response.status_code == 200:
            flash('API Link created successfully!', 'success')
        else:
            flash('Failed to create API Link.', 'danger')

        return redirect(url_for('index'))
    
    return render_template('index.html')

if __name__ == '__main__':
    app.run(debug=True)
