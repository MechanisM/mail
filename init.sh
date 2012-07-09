read -p "Where to store e-mail? (directory; must exist) " DIR
read -p "Gmail e-mail address: " GMAIL_ADDRESS
read -s -p "Gmail password (stored in plaintext in cwd): " GMAIL_PASSWORD

echo "
[general]
ui = ttyui
accounts = Test

[Account Test]
localrepository = Local
remoterepository = Remote

[Repository Local]
type = Maildir
localfolders = $DIR

[Repository Remote]
type = Gmail
remoteuser = $GMAIL_ADDRESS
remotepass = $GMAIL_PASSWORD
realdelete = no

nametrans = lambda folder: re.sub('^inbox$', 'INBOX',
                           re.sub(' +', '_',
                           re.sub(r'.*/(.*)$', r'\1', folder).lower()))
" > imap.conf

echo "export MAIL_DIRECTORY='$DIR'; python app.py" > run.sh
