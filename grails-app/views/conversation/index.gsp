<!DOCTYPE html>
<html>

<head>
  <title>Grails Backbone Demo: Chat</title>
  <meta name="layout" content="main">
  <r:require modules="chat"/>
  
  <r:script disposition="head">
    var todos = ${messages};
  </r:script>
  
  <r:script>
    window.chat.setUri('${createLink(uri: '')}');
  </r:script>

</head>

<body>

<!-- Todo App Interface -->

<div id="chatapp">

  <div class="title">
    <h1>Chat</h1>
  </div>

  <div id="chat-content" class="content">
  	<ul id="chat-participants">
  		<li>p1</li>
  		<li>p2</li>
  		<li>p3</li>
  	</ul>

  	<ul id="chat-messages" data-bind="foreach: messages">
  		<li data-bind="text: text"></li>
  	</ul>

    <form data-bind="submit: sendMessage" >
      <input placeholder="Message" type="text" name="message" id="new-message" />
    </form>
    
    <span class="ui-tooltip-top" >Press Enter to send message</span>

  </div>

</div>

</body>

</html>