$(function(){
  function appendOption(category){ //optionの作成
    let html = `<option value="${category.id}">${category.name}</option>`;
    return html;
  }
  function appendChildrenBox(insertHTML){ // 子セレクトボックスのhtml作成
    let childSelectHtml = '';
      childSelectHtml = `<div class='select-form' id= 'children_wrapper'>
                        <div class='product_category-select'>
                        <select class="category_select-box" id="child_category" name="item[category_id]">
                        <option value="---">選択してください</option>
                        ${insertHTML}
                        </select>
                        <i class='fa fa-chevron-down'></i>
                        </div>
                        <div class= 'product_select-grandchildren'>
                        </div>
                        </div>`;
    $('.product_select-children').append(childSelectHtml);
  }
  function appendgrandChildrenBox(insertHTML){ // 孫セレクトボックスhtml作成
    let grandchildrenSelectHtml = '';
    grandchildrenSelectHtml = `<div class='select-form' id= 'grandchildren_wrapper'>
                              <div class='product_category-select'>
                              <select class="category_select-box" id="grandchild_category" name="item[category_id]">
                              <option value="---">選択してください</option>
                              ${insertHTML} 
                              </select>
                              <i class='fa fa-chevron-down'></i>
                              </div>
                              <div class= 'product_select-grandchildren'>
                              </div>
                              </div>`;
    $('.product_select-grandchildren').append(grandchildrenSelectHtml);
  }

  $('#category_select').on('change', function(){  // 親セレクトボックスの選択肢を変えたらイベント発火
    let productcategory = $('#category_select').val();
  // ↑ productcategoryに選択した親のvalueを代入
    if (productcategory != ''){
  // ↑ productcategoryが空ではない場合のみAjax通信を行う。
      $.ajax({
        url: '/items/category_children',
        type: 'GET',
        data: { productcategory: productcategory },
        dataType: 'json'
      })
      .done(function(children){  // 送られてきたデータをchildrenに代入
        let insertHTML = '';
        children.forEach(function(child){
  // forEachでchildに一つずつデータを代入。子のoptionが一つずつ作成される。
          insertHTML += appendOption(child);
        });
        appendChildrenBox(insertHTML);
        $("#category_select").on('change', function(){
  // 通信成功時に親の選択肢を変えたらイベント発火。子と孫を削除。selectのidにかけるのではなく、親要素にかけないと残ってしまう。
          $('#children_wrapper').remove();
          $('#grandchildren_wrapper').remove();
        })
      })
      .fail(function(){
        alert('カテゴリー取得に失敗しました');
      })
    }
  });

  // document、もしくは親を指定しないと発火しない
  $(document).on('change', '#child_category', function(){
    let productcategory = $('#child_category').val();
    if (productcategory != ''){
    $.ajax ({
      url: '/items/category_grandchildren',
      type: 'GET',
      data: { productcategory: productcategory },
      dataType: 'json'
    })
    .done(function(grandchildren){
      console.log(grandchildren)
      let insertHTML = '';
      grandchildren.forEach(function(grandchild){
        insertHTML += appendOption(grandchild);
      });
      appendgrandChildrenBox(insertHTML);
      $("#category_select").on('change', function(){
  // 通信成功時に親の選択肢を変えたらイベント発火。子と孫を削除。selectのidにかけるのではなく、親要素にかけないと残ってしまう
        $('#grandchildren_wrapper').remove();
        })
      })
    .fail(function(){
      alert('カテゴリー取得に失敗しました');
    })
    }
  });
});