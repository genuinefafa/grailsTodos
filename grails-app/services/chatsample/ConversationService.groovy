package chatsample

import grails.events.Listener

/**
 * Author: facupedra * genuinefafa
 * Date: 01/25/13
 */
class ConversationService {

    @Listener(namespace='chat')
    void send(evt){
        log.info evt
    }
	
	@Listener(namespace='browser')
	void sendMessage(evt){
		log.info evt.message
        Message m = new Message(text: evt.message);
        event topic: 'newMessage', data: m
	}

	@Listener(namespace='browser')
	void joinConversation(evt){
		
		event topic: 'newMessage', data: m
	}

}
