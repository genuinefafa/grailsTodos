package chat

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
	}

}
