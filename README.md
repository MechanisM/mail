Mail
===============================================================================

*The ultimate e-mail client*

Sync your e-mail account to your local machine via IMAP and manage it locally
over HTTP by passing JSON messages.

**Super alpha**: Be careful

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

This is a programmer's e-mail client.  The possibilities are endless.
Regex-based filters, script everything, callbacks when an e-mail comes, etc.
You can say things like: download all the attachments that this person sent me
last summer, put them into a tar and upload it to S3.  Automatic backup, your
own layer of spam filtering, collect your contacts based on predefined rules,
... Automate your e-mail workflow.  It runs over HTTP so it's language
agnostic.  Do you like a web-based client or do you prefer a console based one?

Installation
------------

    $ git clone git://github.com/honza/mail.git
    $ cd mail
    $ # create and activate a virtual environment
    $ pip install -r requirements.txt
    $ sh init.sh    # This will create `sync.sh` and `run.sh`
    $ sh sync.sh    # Might take a while the first time
    $ sh run.sh

**Warning**: It currently saves your password in a file in plaintext.  This
file is placed within the project.  I'm currently trying to figure out a better
solution.  If you are worried about the security, feel free to explore to
source code to make sure that I'm not misusing your password.

How does it work?
-----------------

Mail uses the awesome [offlineimap][1] library to sync your email to your
computer.  It saves each individual each in a file on disk.  Mail then parses
this data and presents it over HTTP using the [Flask][2] framework.

Currently implemented endpoints
-------------------------------

At this point, Mail is read-only.

* `/inbox/all`
* `/inbox/read`
* `/inbox/new`

Batteries included
------------------

Mail includes a simple web app to show what is possible.  You can access it by
going to the root of the project.  It's written in CoffeeScript using
Backbone.js.  Precompiled Javascript files are included in the project so you
can try it out without messing with CoffeeScript if you hate it.

TODO
----

* Automatic syncing
* Sending
* Marking as read
* Archiving
* Attachments
* Threaded messages

License
-------

BSD, short and sweet

[1]: https://github.com/nicolas33/offlineimap
[2]: http://flask.pocoo.org/
