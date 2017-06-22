$(function() {
  function buildHTML(message) {
    var messageBody = '<ui><li class="user">' + message.userName + '</li>'
                    + '<li class="timestamp">' + message.createdAt + '</li>'
                    + '<li class="textinchat">' + message.body + '</li>';
                    if (message.image.url == null) {
                      return messageBody;
                    } else {
                      return messageBody + "<li><img src=" + message.image.url + "></li>";
    }
  }

// フォームをクリアする記述
  function clearingForm() {
    $('.textingfield').val("");
    $('.massage_image').val("");
  }

// スクローリングanimateの記述
  function animateScroll() {
    $(".area").animate({
      scrollTop: $(".js-messages").height()
    }, 1000, "swing");
   }

// フォーム送信で発火する記述
  $('#btninindex').on('submit', function(e) {
    e.preventDefault();
    var formData = new FormData($('form').get(0));
    var chatUrl = $("form#new_message").attr('action');
    $.ajax({
      type: 'POST',
      url: chatUrl,
      data: formData,
      dataType: "json",
      processData: false,
      contentType: false
    })
// done、テキストとファイルを投稿&テキスト入力欄クリア、スクロール呼び出し
    .done(function(message){
      var html = buildHTML(message);
      $('.start').append(html);
      clearingForm();
      animateScroll();
      })
    .fail(function(){
       alert('error');
      });
    });

});


