// DOM読み込みが完了したら実行
document.addEventListener("DOMContentLoaded", (e) => {
  if (document.getElementById("token_submit") != null) {
    // pay.jpの公開鍵
    Payjp.setPublicKey("pk_test_0f3486b39d3ab4453227587b");

    // ボタンのイベントハンドリング
    var btn = document.getElementById("token_submit");
    //ボタンが押された時に作動
    btn.addEventListener("click", (e) => {
      //ボタンを無効化
      e.preventDefault();

      // カード情報生成
      var card = {
        number: document.getElementById("card_number").value,
        cvc: document.getElementById("cvc").value,
        exp_month: document.getElementById("exp_month").value,
        exp_year: document.getElementById("exp_year").value
      };

      // Payjp.createTokenというメソッドを使ってトークンを生成
      Payjp.createToken(card, (status, response) => {
        // 正しいカード情報であれば200
        if (status === 200) {
          // 自サーバーにデータをpostしないようにするため.removeAttrで属性を削除
          $("#card_number").removeAttr("name");
          $("#cvc").removeAttr("name");
          $("#exp_month").removeAttr("name")
          $("#exp_year").removeAttr("name")
          // .appendでHTML要素を追加
          $("#card_token").append(
            $(`<input type="hidden" name="payjp-token">`).val(response.id)
          );
          document.inputForm.submit();
          alert("登録が完了しました");
        } else {
          alert("カード情報が正しくありません");
        }
      });
    });
  }
}, false);
