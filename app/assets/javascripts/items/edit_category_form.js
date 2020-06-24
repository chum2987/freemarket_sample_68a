$(function(){
  function appendOption(category){
    var html = `<option value="${category.id}">${category.name}</option>`;
    return html;
  }

  function appendChild(insertHTML) {
    var childSelectEditHtml = '';
    childSelectEditHtml = ` <div class="listing-select-wrapper--edit__child">
                          <select class="listing-select-wrapper--edit__child--select" id="child_category_edit" name="item[category_id]" required="true">
                            <option value="---">選択してください</option>
                            ${insertHTML}
                          </select>
                        </div>`;
    $('.listing-select-wrapper--edit').append(childSelectEditHtml);
  }

  function appendGrandChild(insertHTML) {
    var grandchildSelectEditHtml = '';
    grandchildSelectEditHtml = `<div class="listing-select-wrapper--edit__grandchild">
                          <select class="listing-select-wrapper--edit__grandchild--select" id="grandchild_category_edit" name="item[category_id]" required="true">
                            <option value="---">選択してください</option>
                            ${insertHTML}
                          </select>
                        </div>`;
    $('.listing-select-wrapper--edit').append(grandchildSelectEditHtml);
  }

// 親カテゴリーの値が変わった時の処理
  $(document).on('change', '#parent_category_edit', function() {
// 親カテゴリーのデータを取得して変数にいれる
    var parentCategoryEdit = document.getElementById('parent_category_edit').value;
    if (parentCategoryEdit != '選択してください'){
      $.ajax({
        url: '/items/category_children',
        type: 'GET',
        data: { productcategory: parentCategoryEdit },
        dataType: 'json'
      })
// 成功した時の処理
      .done(function(children){
// 元々あった子カテゴリーと孫カテゴリーを消す。
        $('.listing-select-wrapper--edit__child').remove();
        $('.listing-select-wrapper--edit__grandchild').remove();
// insertHTMLを定義して中身にオプションをつける。
        var insertHTML = '';
        children.forEach(function(child){
          insertHTML += appendOption(child);
        });
// オプション付きのinsertHTMLをappendChildにいれる。
        appendChild(insertHTML);
      })
      .fail(function(){
        alert('カテゴリー取得に失敗しました');
      })
    }else {
      $('#child_category_edit').remove();
      $('#grandchild_category_edit').remove();
    }
  });

  // 子カテゴリーとベースは同じ
  $(document).on('change', '#child_category_edit', function(){
    var childIdEdit = document.getElementById('child_category_edit').value;
    if (childIdEdit !== '選択してください') {
      $.ajax({
        url: '/items/category_grandchildren',
        type: 'GET',
        data: { productcategory: childIdEdit },
        dataType: 'json'
      })
      .done(function(grandchildren) {
        if (grandchildren.length != 0) {
          $('.listing-select-wrapper--edit__grandchild').remove();
          var insertHTML = '';
          grandchildren.forEach(function(grandchild){
            insertHTML += appendOption(grandchild);
          });
          appendGrandChild(insertHTML);
        }
      })
      .fail(function(){
        alert('カテゴリー取得に失敗しました');
      })
    }else {
      $('#grandchild_category_edit').remove();
    }
  })
})