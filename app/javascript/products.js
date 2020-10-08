// $(document).on('turbolinks:click', function(){
$(function(){


  // プレビュー機能
  
  // $('.input-area').on('change', '.image_upload', function(e){
  $(document).on('change', '.image_upload', function(e){
    // debugger
    // e.preventDefault();
    // inputの要素はクリックされておらず、inputの親要素であるdivが押されている。
    // だからdivのクラス名をclickした時にイベントが作動。
    // div（this）から要素を辿ればinputを指定することが可能。

    // $liに追加するためのプレビュー画面のHTML。横長でないとバグる
    var preview = $('<div class="image-preview__wapper"><img class="preview"></div><div class="image-preview_btn"><div class="image-preview_btn_delete">削除</div></div>'); 
    //次の画像を読み込むためのinput。 
    var append_input = $(`<li class="input"><label class="upload-label"><div class="upload-label__text">ファイルをアップロード<div class="input-area"><input class="hidden image_upload" type="file"></div></div></label></li>`)

  

    $ul = $('#previews')
    $li = $(this).parents('li');
    $label = $(this).parents('.upload-label');
  
  
    //inputに画像を読み込んだら、"プレビューの追加"と"新しいli追加"処理が動く
    // $('.image_upload').on('change', function (e) {
      //inputで選択した画像を読み込む
      var reader = new FileReader();

      // プレビューに追加させるために、inputから画像ファイルを読み込む。
      reader.readAsDataURL(e.target.files[0]);

      //画像ファイルが読み込んだら、処理が実行される。 
      reader.onload = function(e){
        //previewをappendで追加する前に、プレビューできるようにinputで選択した画像を<img>に'src'で付与させる
        // つまり、<img>タグに画像を追加させる
        $(preview).find('.preview').attr('src', e.target.result);
      }

      //inputの画像を付与した,previewを$liに追加。
      $li.append(preview);
      // debugger

      //プレビュー完了後は、inputを非表示にさせる。これによりプレビューだけが残る。
      $label.css('display','none'); // inputを非表示
      $li.removeClass('input');     // inputのクラスはjQueryで数を数える時に邪魔なので除去
      $li.addClass('image-preview'); // inputのクラスからプレビュー用のクラスに変更した
      $lis = $ul.find('.image-preview'); // クラス変更が完了したところで、プレビューの数を数える。 
      $('#previews li').css({
        'width': `114px`
      })

      //"ul"に新しい"li(inputボタン)"を追加させる。
      if($lis.length <= 4 ){
        $ul.append(append_input)
        $('#previews li:last-child').css({
          'width': `calc(100% - (20% * ${$lis.length}))`
        })
      }

      $inputs = $ul.find('.image_upload');
      // console.log($inputs)

      //inputの最後の"data-image"を取得して、input nameの番号を更新させてる。
      // これをしないと、それぞれのinputの区別ができず、最後の1枚しかDBに保存されません。
      // 全部のプレビューの番号を更新することで、プレビューを削除して、新しく追加しても番号が1,2,3,4,5,6と綺麗に揃う。だから全部の番号を更新させる
      $inputs.each( function( num, input ){
        //nameの番号を更新するために、現在の番号を除去
        $(input).removeAttr('name');
        $(input).attr({
          // name:"product[images_attributes][" + num + "][image]",
          name:`product[images_attributes][${num}][image]`,
          id:"product_images_attributes_" + num + "_image"
        });
      });
  })
// エラーがでたときにインプットボタンを１つに戻す（複数投稿しちゃうとその数だけボタンが残っちゃうので）
  

});

$(window).on('load', function () {
  var image_files = document.getElementsByClassName('image_file_box');
  const imgLength = image_files.length;
  console.log(imgLength)
  
  for (var i = (imgLength - 1) ; i >= 1 ; i--) {
    image_files[i].remove();

      // var num = (image_files.length - 1);
      // console.log(image_files.length)
      // console.log(num)
      
      // console.log(image_files.length)
    
  }
})

// $(document).on("click", ".image_upload", function () {
//   //$liに追加するためのプレビュー画面のHTML
//   var preview = $(
//     `<div class="image-preview__wapper"><img class="preview"></div><div class="image-preview_btn"><div class="image-preview_btn_delete">削除</div></div>`
//   );
//   //次の画像を読み込むためのinput。処理の最後にappendで追加する。
//   var append_input = $(
//     `<li class="input"><label class="upload-label"><div class="upload-label__text">ドラッグアンドドロップ<br>またはクリックしてファイルをアップロード<div class="input-area"><input class="hidden image_upload" type="file"></div></div></label></li>`
//   );
//   $ul = $("#previews");
//   $li = $(this).parents("li");
//   $label = $(this).parents(".upload-label");
//   $inputs = $ul.find(".image_upload");
//   //inputに画像を読み込んだら、"プレビューの追加"と"新しいli追加"処理が動く
//   $(".image_upload").on("change", function (e) {
//     //inputで選択した画像を読み込む
//     var reader = new FileReader();

//     // プレビューに追加させるために、inputから画像ファイルを読み込む。
//     reader.readAsDataURL(e.target.files[0]);

//     //画像ファイルが読み込んだら、処理が実行される。
//     reader.onload = function (e) {
//       //previewをappendで追加する前に、プレビューできるようにinputで選択した画像を<img>に'src'で付与させる
//       $(preview).find(".preview").attr("src", e.target.result);
//     };

//     //inputの画像を付与した,previewを$liに追加。
//     $li.append(preview);

//     //プレビュー完了後は、inputを非表示にさせる。これによりプレビューだけが残る。
//     $label.css("display", "none");
//     $li.removeClass("input");
//     $li.addClass("image-preview");
//     $lis = $ul.find(".image-preview");

//     $("#previews li").css({
//       width: `114px`,
//     });
//     //"ul"に新しい"li(inputボタン)"を追加させる。
//     if ($lis.length <= 4) {
//       $ul.append(append_input);
//       $("#previews li:last-child").css({
//         width: `calc(100% - (20% * ${$lis.length}))`,
//       });
//     // } else if ($lis.length == 5) {
//     //   $li.addClass("image-preview");
//     //   $ul.append(append_input);
//     //   $("#previews li:last-child").css({
//     //     width: `100%`,
//     //   });
//     // } else if ($lis.length <= 9) {
//     //   $li.addClass("image-preview");
//     //   $ul.append(append_input);
//     //   $("#previews li:last-child").css({
//     //     width: `calc(100% - (20% * (${$lis.length} - 5 )))`,
//     //   });
//     }

//     // inputの最後の"data-image"を取得して、input nameの番号を更新させてる。
//     $inputs.each(function (num, input) {
//       //nameの番号を更新するために、現在の番号を除去
//       $(input).removeAttr("name");
//       $(input).attr({
//         name: "product[images_attributes][" + num + "][image]",
//         id: "product_images_attributes_" + num + "_image",
//       });
//     });
//   });
// });

// エラーがでたときにインプットボタンを１つ戻す（複数投稿しちゃうとその数だけボタンが残っちゃうので）
// $(document).on('turbolinks:load', function () {
//   var image_files = document.getElementsByClassName('image_file_box');
//   console.log(image_files.length);
//   for (var i = 1; i < image_files.length; i++) {
//     image_files[i].remove();
//   }
// })

// $(document).on('click', '.image_upload', function () {

//   // 変数previewにhtmlを代入(プレビュー表示)
//   var preview = $(
//     `<div class="image-preview__wapper"><img class="preview" width="100" height="100"></div><div class="image-preview_btn"><div class="image-preview_btn_edit">編集</div><div class="image-preview_btn_delete">削除</div></div>`
//   );

//   // 変数append_inputにhtmlを代入（画像投稿後のボタン表示）
//   var append_input = $(
//     `<li class="input"><label class="upload-label"><div class="upload-label__text">ドラッグアンドドロップ<br>またはクリックしてファイルをアップロード<div class="input-area"><input class="hidden image_upload" type="file"></div></div></label></li>`
//   );

//   // id要素のpreviewsをセレクタ指定
//   $ul = $('#previews');
//   // オンクリック＝ファイル投稿をクリックしたときに、その上の階層にあるli要素を取得
//   $li = $(this).parents('li');
//   $label = $(this).parents('.upload-label');
//   $inputs = $ul.find('.image_upload');

//   // image_upload要素が変更されたときに発生(=画像が投稿（選択）されたとき)
//   $('.image_upload').on('change', function (e) {
//     var reader = new FileReader();

//     // 画像の読み込み
//     reader.readAsDataURL(e.target.files[0]);

//     // 画像のロードが終わったあとにイベント発生
//     reader.onload = function(e) {
//       // previewクラスのsrcをe.target.result=ロードした画像に変更
//       $(preview).find('.preview').attr('src', e.target.result);
//     };

//     $li.append(preview);

//     $label.css('display', 'none');
//     $li.removeClass('input');
//     $li.addClass('image-preview');
//     $lis = $ul.find('.image-preview');

//     $('previews li').css({
//       width: '114px',
//     })

//     if ($lis.length <= 4) {
//       $ul.append(append_input);
//       // $("#previews li:last-child").css({
//       $("input").css({  
//         'width': 'calc(100% - (20% * ${$lis.length}))'
//       })
//     } else if ($lis.length == 5) {
//       $li.addClass('image-preview');
//       $ul.append(append_input);
//       $("input").css({  
//       // $('#previews li:last-child').css({
//         'width': '100%'
//       })
//     } else if ($lis.length <= 9) {
//       $li.addClass('image-preview');
//       $ul.append(append_input);
//       $("input").css({  
//       // $('#previews li:last-child').css({
//         'width': 'calc(100% - (20% * (${$lis.length} - 5)))'
//       })
//     }
//     // $inputs.each( function ( num, input ) {
//     //   $(input).removeAttr("name");
//     //   $(input).attr({
//     //     image: "product[images_attributes][" + num + "][name]",
//     //     id: "product_images_attributes_" + num + "_name" ,
//     //   });
//     // });
//   });
// });

