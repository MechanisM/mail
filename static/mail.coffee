# Main client file for mail.
#
# This files depends on jquery, underscore, backbone and utils.js (Mail
# namespace)


class Email extends Backbone.Model
    from: ->
        Mail.escapeEmailAddress @get('from')

    body: ->
        body = @get('body')
        if body.html
            body.html
        else
            body.plain


class EmailCollection extends Backbone.Collection
    model: Email
    url: '/inbox/all'
    parse: (response) -> response.messages


class EmailView extends Backbone.View

    className: 'message'

    events:
        'click span': 'toggleBody'

    toggleBody: ->
        @$el.find('.body').toggle()

    render: ->
        @$el.html """
        <span>
            <strong>#{@model.get('subject')}</strong>
            - #{@model.from()}
            </span>
        <div class="body">
        #{@model.body()}
        </div>
        """
        @$el


class Application extends Backbone.View

    initialize: ->
        @$messages = $ '#messages'

        @inbox = new EmailCollection
        @inbox.on 'reset', @renderInbox, @
        @inbox.fetch()

    renderInbox: ->
        for email in @inbox.models
            view = new EmailView model: email
            @$messages.append view.render()


$ ->
    Mail.app = new Application
