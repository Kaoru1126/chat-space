$(function() {
  // urlを定義する記述
  // var chatUrl = $("form#new_message").attr('action');
  // console.log(url02);
  // function get_url_with_group_id(){
  //   var group_id = $('.group_id').attr('value');
  //   var url = '/groups/' + group_id + '/messages'
  //   return url
  // }

  // buildHTMLの中身、JSONと照らし合わせて
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

// スクローリングanimate?の記述を作る
  function animateScroll() {
    $(".area").animate({
      scrollTop: $(".js-messages").height()
    }, 1000, "swing");
   }

// (2)フォームが送信されたら、イベントが発火するようにする//発火記述  this:イベントを発火の要素⇒btnindex
  $('#btninindex').on('submit', function(e) {
    e.preventDefault();
    // console.log($('form').get(0));
    var formData = new FormData($('form').get(0));
    // var url = $(this).get(0).action;
    var chatUrl = $("form#new_message").attr('action');
    // console.log(this);
    $.ajax({
      type: 'POST',
      url: chatUrl,
      data: formData,
      dataType: "json",
      processData: false,
      contentType: false
    })
       // .doneからテキストとファイルを投稿&テキスト入力欄をクリアwithFunctionで、そしてスクロール
    .done(function(message){
      // e.preventDefault();
      // console.log(message);
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


// メッセージ送信機能実装のステップ
// (1) jsファイルを作成する
// (2) フォームが送信されたら、イベントが発火するようにする
// (3) 2のイベントが発火したときにAjaxを使用して、messages#createが動くようにする
// (4) messages#createでメッセージを保存し、respond_toを使用してHTMLとJSONの場合で処理を分ける
// (5) jbuilderを使用して、作成したメッセージをJSON形式で返す
// (6) 返ってきたJSONをdoneメソッドで受取り、HTMLを作成する
// (7) 6で作成したHTMLをメッセージ画面の一番下に追加する
// (8) HTMLを追加した分、メッセージ画面を下にスクロールする
// (9) 非同期に失敗した場合の処理も準備する


// 1. jsファイルを作成する
// これからAjaxを含むJavaScrpt（jQuery）処理を記述していくファイルを作成してください。

// 2. フォームが送信されたら、イベントが発火するようにする

// 続いてフォームが送信されたときにイベントが動くようにしましょう。
// このとき使用するイベントはclickではありません。
// 「フォームが送信されたとき」というイベントは何かを調べる必要があります。
// イベントを設定したら、console.logなどを使用してフォームが送信されたときにイベントが発火しているかどうかを確認しておきましょう。

// 3. 2のイベントが発火したときにAjaxを使用して、messages#createが動くようにする

// 2で設定したイベントが問題なく動作するのであれば、Ajaxで非同期通信できるようにしましょう。
// Ajaxを使用して、messages#createを呼ぶようにしましょう。
// このとき、フォームに入力されている値をコントローラに送らなければなりません。
// 入力された値を一つずつ取得しても良いのですが、formDataを使用するとフォームに入力された値をまとめて取得することができます。
// formDataを使用して、フォームに入力された値を取得しましょう。
// 取得ができたら、必要なAjax関数のオプションを揃えて非同期通信を行いましょう

// 4. messages#createでメッセージを保存し、respond_toを使用してHTMLとJSONの場合で処理を分ける

// 非同期通信によって、messages#createを動かくすことに成功したら、メッセージが保存できているか確認しましょう。
// 正しくAjaxからdataを遅れていれば、そのまま保存まですることができるはずです。
// 保存ができていることを確認したら、respond_toを使用してHTMLとJSONの場合で処理を分けてください。

// 5. jbuilderを使用して、作成したメッセージをJSON形式で返す

// respond_toで処理を分けたら、jbuilderを使用して返すデータを作成しましょう。
// jbuilderは、viewを同じように該当するアクションと同じ名前にする必要があります。
// usersのshowアクションに対応するjbuilderのファイルであれば、users/show.json.jbuilderになります。
// jbuilderのファイルには、JavaScriptで必要な情報を渡すようにしましょう。

// 6. 返ってきたJSONをdoneメソッドで受取り、HTMLを作成する

// 非同期通信の結果として返ってくるデータは、done(function(data) { 処理 })の関数の引数で受け取ります。
// この引数を元にHTMLを組み立てましょう。
// 組み立てるHTMLは、もともとビューに表示しているHTMLと同じものを作成するようにしましょう。
// done()の関数の中で、HTMLを作成する記述を一からしてしまうと、コード量が多くなってしまうので、HTMLを作成するメソッドを作成すると良いでしょう。

// 7. 6で作成したHTMLをメッセージ画面の一番下に追加する

// 6で作成したHTMLをメッセージ全体の一番下に追加しましょう。
// HTMLを追加するメソッドを使用すれば簡単ですね。

// 8. HTMLを追加した分、メッセージ画面を下にスクロールする

// 7でメッセージを追加したら、メッセージの最下部まで自動でスクロールするようにしましょう。
// スクロールには、animateというメソッドを使用しましょう。
// 詳細な使い方は調べながら実装しましょう。

// 9. 非同期に失敗した場合の処理も準備する

// 最後に非同期通信に失敗した場合の実装を行いましょう。
// 失敗した場合には、ユーザーにエラーを知らせるようなアラートを出せばよいでしょう。

// ここまででメッセージ送信の非同期通信化は終了になります。
// 実装が完了したら、次に進む前にプルリクエストを出しましょう。
// プルリクエストにLGTMが出たら、マージして次のインクリメンタルサーチに進んでください。

