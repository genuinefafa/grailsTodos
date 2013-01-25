<!DOCTYPE html>
<html>

<head>
  <title>Grails Backbone Demo: Chat</title>
  <meta name="layout" content="main">
  <r:require modules="conversation"/>
  <r:require modules="knockout"/>
  
  <r:script disposition="head">
    var todos = ${messages};
  </r:script>
  <r:script>
$(function(){
  window.grailsEvents = new grails.Events('${createLink(uri: '')}');

  grailsEvents.on("newMessage", function(data){
    console.log("llego: "+data);
  });
});

var ChatViewModel = function(){
    var self = this;
    self.message = ko.observable("");
    self.messages = ko.observableArray([]);
    
    self.sendMessage = function(){
        console.log("message will be: " + self.message());
        grailsEvents.send('sendMessage', {'message' : self.message()});
        self.message("");
    }    
}
var cvm = new ChatViewModel();
ko.applyBindings(cvm);

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
      <form data-bind="submit: sendMessage">
        <input placeholder="Message" type="text" data-bind="value: message"/>
      </form>
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