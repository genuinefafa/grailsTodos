<!DOCTYPE html>
<html>

<head>
  <title>Grails Backbone Demo: Chat</title>
  <meta name="layout" content="main">
  <r:require modules="conversation"/>

  <r:script disposition="head">
    var todos = ${messages};
  </r:script>
  <r:script>
$(function(){
  window.grailsEvents = new grails.Events('${createLink(uri: '')}');

  grailsEvents.on("conversation", function(data){
        console.log(model);
        
  });
});

$("#newMessage").keypress(function(evt) {
	console.log(evt.keyCode);
	if (evt.keyCode == "13") {
		var message = $("#newMessage")
		console.log("message will be: " + message.val());
		console.log(message);
		grailsEvents.send('sendMessage', {'message' : message.val()}  );	
	}
});

  </r:script>
</head>

<body>

<!-- Todo App Interface -->

<div id="todoapp">

  <div class="title">
    <h1>Chat</h1>
  </div>

  <div class="content">

    <div id="create-todo">
      <input id="newMessage" placeholder="Message" type="text"/>
      <span class="ui-tooltip-top" style="display:none;">Press Enter to save this task</span>
    </div>

    <div id="todos">
      <ul id="todo-list"></ul>
    </div>

    <div id="todo-stats"></div>

  </div>

</div>

<!-- Templates -->

<script type="text/template" id="item-template">
  <div class="todo {{ done ? 'done' : '' }}">
    <div class="display">
      <input class="check" type="checkbox" {{ done ? 'checked="checked"' : '' }} />
      <div class="todo-content">{{ content }}</div>
      <span class="todo-destroy"></span>
    </div>

    <div class="edit">
      <input class="todo-input" type="text" value=""/>
    </div>
  </div>
</script>

<script type="text/template" id="stats-template">
  {! if (total) { !}
  <span class="todo-count">
    <span class="number">{{ remaining }}</span>
    <span class="word">{{ remaining == 1 ? 'item' : 'items' }}</span> left.
  </span>
  {! } !}
  {! if (done) { !}
  <span class="todo-clear">
    <a href="#">
      Clear <span class="number-done">{{ done }}</span>
      completed <span class="word-done">{{ done == 1 ? 'item' : 'items' }}</span>
    </a>
  </span>
  {! } !}
</script>

</body>

</html>