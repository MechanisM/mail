mail
===============================================================================

*The ultimate e-mail client*

Sync your e-mail account to your local machine via IMAP and manage it locally
over HTTP by passing JSON messages.

**Super alpha**: Documentation is on its way

Huh?
----

Want to get all the e-mails in your inbox?

    $ curl http://localhost:4433/inbox/all

    {
        "count": 1,
        "messages": [
            "from": "Mom <mother@example.com>",
            "subject": "Eat your vitamins",
            "date": "Mon, 09 Jul 2012 14:08:54 -0300",
            "body": {
                "plain": "...",
                "html": "..."
            }
        ]
    }

License
-------

BSD, short and sweet
