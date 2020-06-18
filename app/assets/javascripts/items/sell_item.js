// 1 document ＝ 開いているWebページのDOMツリーが入っているオブジェクト
// 2 turbolinks:load ＝ 初回読み込み、リロード、ページ切り替えで動く。
// 3 画像選択ボタンのinputを生成する関数
$(function() {
  // 1 const = 値書き換えを禁止した変数を宣言する方法(例:消費税率) 
  // 2 この変数buildFileFieldに入れているdiv class〜は、viewの「ファイルを選択ボタン」の箇所
  const buildFileField = (index)=> {
    var html = `<div class="js-file_group" data-index="${index}">
    <input class="js-file" type="file"
    name="item[item_images_attributes][${index}][item_image]"
    id="item_item_images_attributes_${index}_item_image"><br>
    <div class="js-remove">削除</div>
    </div>`;
    return html;
  }

  // プレビュー用のimgタグを生成する関数
  const buildImg = (index, url)=> {
    const html = `<img data-index="${index}" src="${url}" width="100px" height="100px">`;
    return html;
  }

  // 1 file_fieldのnameに動的なindexをつける為の配列（上記のindexに入る数字）
  let fileIndex = [1,2,3,4,5,6,7,8,9,10];
  // すでに使われているindexを除外
  lastIndex = $('.js-file_group:last').data('index');
  fileIndex.splice(0, lastIndex);
  
  $('.hidden-destroy').hide();

  // 1 image-box__container = 「ファイルを選択」の親要素
  // 2 親要素をセレクトし、js-fileクラスが動き出したら、下の処理がスタート
  $('#image-box__container').on('change', '.js-file', function(e) {
    const targetIndex = $(this).parent().data('index');
    // ファイルのブラウザ上でのURLを取得する
    const file = e.target.files[0]
    const blobUrl = window.URL.createObjectURL(file);

    // 該当indexを持つimgがあれば取得して変数imgに入れる(画像変更の処理)
    if (img = $(`img[data-index="${targetIndex}"]`)[0]) {
      img.setAttribute('src', blobUrl);
    } else { // 新規画像追加の処理
      $('#previews').append(buildImg(targetIndex, blobUrl));
      // 1 shift() メソッド = 配列から最初の要素を取り除き使用する
      // 2 fileIndexの配列の先頭の数字を使ってinputを作る
      $('#image-box__container').append(buildFileField(fileIndex[0]));
      fileIndex.shift();
      //1 push()メソッド = 配列の最後に1つ以上の要素を追加し、新しい配列のlengthを返します。
      //2 これで永遠に数が追加されていき、複数枚画像投稿が可能となる
      //3 末尾の数に1を足した数を追加する
      fileIndex.push(fileIndex[fileIndex.length - 1] + 1)
    }
  });
  
  //1 画像入力欄が0個にならないようにしておく
    $('#image-box__container').on('click', '.js-remove', function() {
      const targetIndex = $(this).parent().data('index');
      // 該当Indexを振られているチェックボックスを取得する
      const hiddenCheck = $(`input[data-index="${targetIndex}"].hidden-destroy`);
      // もしチェックボックスが存在すればチェックを入れる
      if (hiddenCheck) hiddenCheck.prop('checked', true);

      $(this).parent().remove();
      $(`img[data-index="${targetIndex}"]`).remove();
      // 画像入力欄が0個にならないようにしておく
      if ($('.js-file').length == 0) $('#image-box__container').append(buildFileField(fileIndex[0]));
    });
});
