var allGroups;
var allCards;
function addGroups() {
  $('#group_form').on("submit", function(e){
    e.preventDefault();
    input = $('input#group_group_name');
    $.ajax({
      url: '/users/' + localStorage["user_id"] + '/groups',
      // localStorage["user_id"] is a key for a special localstorage hash
      // that can be found in application.html.erb DmitryJ
      type: 'POST',
      data: {group_name: input.val()}
    });
    input.val("");
  showGroups();
  });
}

function getConnections(){
  $.getJSON("/connections", function(response){
    var allConnections = response;
    $("ul.connection-cards").empty();
      for(var i = 0; i < allConnections.length; i++){
        if(allConnections[i].user_id == localStorage["user_id"]) {
          var connect = $("<div class='card' data-connection=" + allConnections[i].id + ">");
          $.getJSON("/cards/" + allConnections[i].card_id, function(cardFound) {
            connect.attr("id", cardFound.id);
            $("ul.connection-cards").append(connect);
            $("<li>" + cardFound.email + "</li>").appendTo(connect);
            $("<li>" + cardFound.phone_number + "</li>").appendTo(connect);
            $("<li>" + cardFound.organization + "</li>").appendTo(connect);
            $("<li>" + cardFound.position + "</li>").appendTo(connect);
            $("<button id='add-group'> + </button>").appendTo(connect);
            $("#add-group").on("click", addCardToGroup);
          });
          // group_id, card_id - pass into addCardToGroup
        }
      }
  });
}

// card_id - pass into addCardToGroup

function addCardToGroup(){
  var groups = $(".card");
  $("<ul class='groups_popup'>").appendTo(groups);
  $.getJSON("/users/" + localStorage["user_id"] + "/groups", function(response){
    allGroups = response;
    for(var i = 0; i < allGroups.length; i++) {
      checkbox = $("<input type='checkbox'>");
      $("<li id=" + allGroups[i].id + ">" + allGroups[i].group_name + "</li>").appendTo("ul.groups_popup").append(checkbox);
      checkbox.on("change", selectGroup)
      //card_id
      
    }
  });
}
// group_id, card_id - pass into selectGroup
function selectGroup() {
  var group_id = $(this).parent().attr('id');
  var connection_id = $(this).parent().parent().parent().attr("data-connection");
  if(this.checked == true){
    $.ajax({
      url: "/groupsconnections",
      data: {connection: connection_id, group: group_id},
      type: "POST"
    }); 
  } else {
    $.ajax({
      url: "/groupsconnections",
      data: {connection: connection_id, group: group_id},
      type: "DELETE"
    })
  }
}


function showGroups() {
  $.getJSON("/users/" + localStorage["user_id"] + "/groups", function(response) {
    allGroups = response;
    $("ul.groups").empty();
    for(var i = 0; i < allGroups.length; i++) {
      ($("<li>" + allGroups[i].group_name + "</li>").append("<span id="+ allGroups[i].id + ">" + ' X ' + "</span>")).appendTo("ul.groups");
    }// for loop ends
    $("span").on("click", function(e){
      var groupId = e.target.id;
      $.ajax({
        url: '/users/' + localStorage["user_id"] + '/groups/' + groupId,
        type: "DELETE",
        success: function(){
          e.target.parentElement.remove();
        }//ends removing element from dom
      });
      //ajax closed
    });// ends listener
  });// ends getJSON
}// ends showGroups

getConnections();
showGroups();
addGroups();