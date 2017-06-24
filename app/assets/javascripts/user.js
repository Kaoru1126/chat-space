$(function(){

  // ここに追加するHTMLの処理を書く
  function buildHTMLForUserSearch(user){
    var userClearfix = '<div class="chat-group-user.clearfix">'
    var userName = '<li.chat-group-user__name>' + user.name + '</li>'
    var addBtn = '<a class = "user-search-add chat-group-user__btn chat-group-user__btn--add" data-user-id= "' + user.id +'" data-user-name= "'+ user.name +'"+>追加</a></div>'
    var addingUser = userClearfix + userName + addBtn;
        return addingUser;
  }

  function newAdding(id, name){

    var newClearfix = '<div class="chat-group-user clearfix">'
    var newuserName = '<li chat-group-user__name style="display:inline">' + name + '</li>'
    var deleteBtn = '<a class = "user-search-remove chat-group-user__btn chat-group-user__btn--remove js-remove-btn"> 削除 </a>' + '<input name="group[user_ids][]" type="hidden" value="' + id + '"></input></div>'
    var newAdding = newClearfix + newuserName + deleteBtn;
     return newAdding;
   }

// 発火からの一連
   $('#user-search-field').on('keyup', function(e){
    e.preventDefault();
    var input = $.trim($(this).val());
    $.ajax({
      url: "/users",
      type: "GET",
      data: ("keyword=" + input),
      dataType: "json"
    })
     .done(function(user){
     $('#removehere').children().remove();
       $(user).each(function(i, user){
        var addingUser = buildHTMLForUserSearch(user)
         $('#removehere').append(addingUser);
       });
     })

     .fail(function(){
       alert('ユーザー検索に失敗しました。');
     });
   });

   $('#removehere').on("click", '.chat-group-user__btn--add', function(){
     var id = $(this).attr("data-user-id");
     var name = $(this).attr("data-user-name");
     $('#chat-group-users').append( newAdding(id, name) )
     $(this).parent().remove();
   });

   $("#chat-group-users").on("click", ".chat-group-user__btn--remove", function(){
     $(this).parent().remove();
     })
 });

