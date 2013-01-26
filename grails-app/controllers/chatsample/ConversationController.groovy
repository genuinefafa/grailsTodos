package chatsample

import grails.converters.JSON

class ConversationController {
	
	def index() {
		
	}
	
	def list() {
		def messages = Message.findAllByOwnerOrTo(params.nickname, params.nickname) as JSON

		if (request.getHeader('X-Requested-With') == 'XMLHttpRequest')
			render(messages)
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
