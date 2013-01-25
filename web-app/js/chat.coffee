class Chat
	constructor: (uri) ->
		@participants = ko.observableArray()
		@messages = ko.observableArray()
		
	setUri: (uri) ->
		console.log('uri', uri)
		@grailsEvents = new grails.Events(uri)
		@grailsEvents.on "newMessage", @receiveMessage
		@grailsEvents.on "aknowledge", @receiveUserHash
		console.log('uri setted', uri, @grailsEvents)
		@joinConversation
	
	sendMessage: (form) ->
		console.log "sendMessage", form
		message = form.message.value
		console.log "message", message
		@grailsEvents.send 'sendMessage', {'message' : message}
		form.message.value = ""
		
	receiveMessage: (data) =>
		console.log "receiveMessage", data
		msg = new Message(data.text)
		console.log(this)
		@messages.push(msg)
	
	joinConversation: () ->
		@grailsEvents.send 'joinConversation'
	
	receiveUserHash: (data) =>
		console.log "receiveUserHash", data
		@userHash = data
		
class Message
	constructor: (text) ->
		@text = ko.observable(text)
		
chat = new Chat()
ko.applyBindings chat, document.getElementById("chat-content")
window.chat = chat