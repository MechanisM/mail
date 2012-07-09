window.Mail = {}

tags = 
    '&': '&amp;'
    '<': '&lt;'
    '>': '&gt;'

replacer = (tag) -> tags[tag] or tag

Mail.escapeEmailAddress = (address) ->
    address.replace /[&<>]/g, replacer

