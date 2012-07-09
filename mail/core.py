import os
from quopri import decodestring
from email import message_from_string


def read_email(filename):
    with open(filename) as f:
        text = f.read()

    message = message_from_string(text)
    payload = message.get_payload()

    if isinstance(payload, list):
        plain = payload[0].get_payload()
        html = payload[1].get_payload()
        html = decodestring(html)
    elif isinstance(payload, str):
        plain = payload
        html = None

    return {
        'from': message['From'],
        'subject': message['Subject'],
        'date': message['Date'],
        'to': message['To'],
        'cc': message.get('CC', None),
        'body': {
            'plain': plain,
            'html': html
        }
    }


def _get_messages(maildir, folder):
    inbox = os.path.join(maildir, folder)
    files = os.listdir(inbox)

    result = []

    for f in files:
        result.append(os.path.join(inbox, f))

    result = map(read_email, result)

    return result


# Public API -----------------------------------------------------------------


def get_unread_messages(maildir):
    """
    Return unread messages from the inbox
    """
    return _get_messages(maildir, 'INBOX/new')


def get_read_messages(maildir):
    """
    Return read messages from the inbox
    """
    return _get_messages(maildir, 'INBOX/cur')


def get_inbox(maildir):
    """
    Return messages from the inbox
    """
    return get_unread_messages(maildir) + get_read_messages(maildir)
