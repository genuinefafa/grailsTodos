modules = {
    todos{
        dependsOn 'jquery, underscore, backbone, grailsEvents'
        resource url: 'js/todos.coffee'
        resource url: 'css/todos.css'
    }
	
	chat {
		dependsOn 'jquery, grailsEvents, knockout'
		resource url: 'js/chat.coffee'
		resource url: 'css/chat.css'

	}

    conversation {
        dependsOn 'jquery, grailsEvents' // knockout
        // resource url: 'js/todos.coffee'
        // resource url: 'css/todos.css'
    }
	
    game{
        dependsOn 'jquery, grailsEvents'
        resource url: 'js/animation/easeljs-0.5.0.min.js'
    }
    backbone {
        resource url: 'js/backbone-min.js'
    }
    underscore {
        resource url: 'js/underscore-min.js'
    }
    knockout {
        resource url:'js/knockout-2.2.0.js'
    }   
}