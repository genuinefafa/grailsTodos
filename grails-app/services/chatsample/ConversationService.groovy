package chatsample

/**
 * Author: facupedra * genuinefafa
 * Date: 01/25/13
 */
class ConversationService {

	@grails.events.Listener(namespace='browser', topic="sendMessage")
	void mboxSendMessage(evt) {
		log.info "mboxSendMessage ${evt} - start"
        Message m = new Message(evt);
		m.to = m.to?:"*"
		m.save(failOnError: true);
		
		if(!m.to=="*") { 
			def homeTopic = "newMessage-${m.owner}";
			log.info "mboxSendMessage ${m} -> to: (not *) ${homeTopic} "
	        event topic: homeTopic, data: m
		} else if (!m.owner.equals(m.to)) {
			def destinationTopic = "newMessage-${m.to}";
			log.info "mboxSendMessage ${m} -> to: (not equal to owner) ${destinationTopic} "
	        event for: '*', topic: destinationTopic, data: m
		}
		
	}
	@grails.events.Listener(namespace='browser', topic="newMessage-null")
	void newMessage(evt) {
		log.info "newMessage ${evt}";
	}

}
