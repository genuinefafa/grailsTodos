class Chat
	constructor: (uri) ->
		@participants = ko.observableArray()
		@messages = ko.observableArray()
		@nickname = ko.observable()
		
	setUri: (uri) ->
		console.log('uri', uri)
		@grailsEvents = new grails.Events(uri)
		console.log('uri setted', uri, @grailsEvents)
	
	sendMessage: (form) ->
		console.log "sendMessage", form
		
		text = form.text.value
		to = form.to.value
		msg = {text : text, owner: @nickname(), to: to}
		
		console.log "sendMessage", msg
		@grailsEvents.send 'sendMessage', msg
		 
		form.text.value = ""

	setNickname: (form) ->
		console.log "setNickname", form

		# reset old topic so we dont receive messages here no more
		oldTopic = "newMessage-#{@nickname()}"
		@grailsEvents.on oldTopic, (data) -> console.log "#{oldTopic}", data
  
		# set new nickname and topic
		@nickname(form.nickname.value)
		topic = "newMessage-#{@nickname()}"
		console.log "topic", topic

		@grailsEvents.on topic, @receiveMessage
		form.nickname.value = "" 
		
		$.get "#{controllerName}/list", {nickname: @nickname()}, (data) => 
			console.log("list", this, data)  
			@messages(data) 
		
	receiveMessage: (data) =>
		console.log "receiveMessage", data
		msg = new Message(data.dateCreated, data.owner, data.to, data.text)
		console.log(this)
		@messages.push(msg)
	
	joinConversation: () ->
		@grailsEvents.send 'joinConversation'
	
class Message
	constructor: (dateCreated, owner, to, text) ->
		@text = ko.observable(text)
		@dateCreated = ko.observable(dateCreated)
		@owner = ko.observable(owner)
		@to = ko.observable(to)
		
chat = new Chat()
ko.applyBindings chat, document.getElementById("chat-content")
window.chat = chat