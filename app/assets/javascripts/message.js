$(function() {

//   画像のみのときにのみ定義されるようにしましょう。
// 使用しないときは無駄な変数の定義になってしまうので。

  function buildHTML(message) {
    if (message.image.url != null) {
       var image = "<li><img src=" + message.image.url + "></li>"
      } else if (message.image.url == null) {
       var image = ""}

    var messageBody = '<div class="js-messages" message-id="' + message.id + '">'
                    + '<ui><li class="user">' + message.userName + '</li>'
                    + '<li class="timestamp">' + message.createdAt + '</li>'
                    + '<li class="textinchat">' + message.body + '</li></div>';
                    + image
                    return messageBody;
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
      scrollTop: $(".area")[0].scrollHeight
    }, "fast");
   }

// 非同期通信の記述
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
      $(".area").append(html);
      clearingForm();
      animateScroll();
      })
    .fail(function(){
       alert('error');
      });
  });

// 自動更新機能の記述
  var interval = setInterval(function() {
    if (window.location.href.match(/\/groups\/\d+\/messages/)) {
    $.ajax({
      type: 'GET',
      url: location.href,
      dataType: 'json'
    })
    .done(function(data) {
      var id = $(".js-messages").last().data("messageid");
      var addingHTML = '';
      $(".js-messages").remove();
      data.messages.forEach(function(message) {
        addingHTML = buildHTML(message);
        $(".area").append(addingHTML);
      });
      var addingHTML = '';
      animateScroll();
    })
      .fail(function(data) {
        alert('自動更新は失敗しています');
      });
    } else {
    clearInterval(interval);
    }} , 15 * 1000 );
});

