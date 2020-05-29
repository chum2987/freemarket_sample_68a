$(function(){
  $('#price_calc').on('input', function(){  // リアルタイムで表示したいのでinputを使う。入力の度にイベントが発火するようになる。
    var data = $('#price_calc').val();  // val()でフォームのvalueを取得(数値)
    let profit = Math.round(data * 0.9)  // 手数料計算を行う。dataにかけているのが0.9なのは単に引きたい手数料が10%のため。
    let fee = (data - profit)  // 入力した数値から計算結果(profit)を引くとそれが手数料になる。
    $('.right_bar').html(fee)  // 手数料の表示。html()は追加ではなく上書きする。入力値が変わる度に表示も変わるようにする。
    $('.right_bar').prepend('¥')  // 手数料の前に￥マークを付けたい
    $('.right_bar_2').html(profit)
    $('.right_bar_2').prepend('¥')
    if(profit == '') {  // もし、計算結果が''なら表示も消す。
    $('.right_bar').html('ー');
    $('.right_bar_2').html('ー');
    }
  })
})