package chatsample

import grails.converters.JSON

class ConversationController {
	
	def index() {
		
	}
	
	def list() {
		def messages = Message.findAll() as JSON

		if (request.getHeader('X-Requested-With') == 'XMLHttpRequest')
			render(todos)
		else {
			render view: 'index', model: [messages: messages]
		}
	}

	def save() {
		def message = new Message(request.JSON)
		message.save()
		render(message as JSON)
	}

}
