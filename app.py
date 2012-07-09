import os
from flask import Flask, jsonify
from mail import get_inbox, get_read_messages, get_unread_messages
from mail.utils import get_template


app = Flask(__name__)
MAIL = os.environ.get('MAIL_DIRECTORY')


@app.route('/')
def index():
    return get_template('index.html')


@app.route('/inbox/all')
def inbox_all():
    messages = get_inbox(MAIL)
    return jsonify({
        'messages': messages,
        'count': len(messages)
    })


@app.route('/inbox/read')
def inbox_read():
    messages = get_read_messages(MAIL)
    return jsonify({
        'messages': messages,
        'count': len(messages)
    })


@app.route('/inbox/new')
def inbox_new():
    messages = get_unread_messages(MAIL)
    return jsonify({
        'messages': messages,
        'count': len(messages)
    })


if __name__ == "__main__":
    app.run(debug=True, port=4433)
