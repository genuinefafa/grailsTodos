<!DOCTYPE html>
<html>

<head>
  <title>Grails Backbone Demo: Chat</title>
  <meta name="layout" content="main">
  <r:require modules="chat"/>
  
  <r:script disposition="head">
	var controllerName = "${createLink(controller: "conversation")}";  
  </r:script>
  
  <r:script>
    window.chat.setUri('${createLink(uri: '')}');
    // chat.messages(<%=messages%>); // we do it with < % 'cause of encoding
  </r:script>

</head>

<body>

<!-- Todo App Interface -->

<div id="chatapp">

  <div class="title">
    <h1>Chat</h1>
  </div>

  <div id="chat-content" class="content">
    <form data-bind="submit: setNickname">
      <input placeholder="Nickname" type="text" name="nickname" id="nickname" /> 
      <strong>Nickname: </strong><span data-bind="text: nickname"></span>
    </form>
  
  	<ul id="chat-participants">
  		<li>p1</li>
  		<li>p2</li>
  		<li>p3</li>
  	</ul>

  	<ul id="chat-messages" data-bind="foreach: messages">
  		<li>
  			<span data-bind="text: dateCreated"></span>
  			<strong><span data-bind="text: owner">owner</span>-&gt;<span data-bind="text: to" />to</strong>
  			<span data-bind="text: text"></span>
  			
  		</li>
  	</ul>

    <form data-bind="submit: sendMessage" >
	<fieldset>
      <input placeholder="Type your message" type="text" name="text" id="new-message" />
      <input placeholder="Destination nickname" type="text" name="to" id="new-message-to" />
      <input type="submit" value="Send" />
    </fieldset>
    </form>
    
    <span class="ui-tooltip-top" >Press Enter to send message</span>

  </div>

</div>

</body>

</html>