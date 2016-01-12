$(document).ready(function(){
    //画面の高さを取得して、変数wHに代入
    var wH = $(window).height(); 
    //div#exampleの高さを取得を取得して、変数divHに代入
    var divH = $('div#main_visual').innerHeight();
    // ボックス要素より画面サイズが大きければ実行
    if(wH > divH){
      // div#topに高さを加える
      $('div#main_visual').css('height',wH+'px'); 
    };
    var wH = $(window).height(); 
    //div#exampleの高さを取得を取得して、変数divHに代入
    var divH = $('div#features').innerHeight();
    // ボックス要素より画面サイズが大きければ実行
    if(wH > divH){
      // div#topに高さを加える
      $('div#features').css('height',wH+'px'); 
    }

});

$(window).resize(function(){
    //画面の高さを取得して、変数wHに代入
    var wH = $(window).height(); 
    //div#exampleの高さを取得を取得して、変数divHに代入
    var divH = $('div#main_visual').innerHeight();
    // ボックス要素より画面サイズが大きければ実行
    if(wH > divH){
      // div#topに高さを加える
      $('div#main_visual').css('height',wH+'px'); 
    }
});