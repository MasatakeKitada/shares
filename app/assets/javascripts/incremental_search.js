$(document).on('ready page:load', function() {
  var
  preFunc = null,
  preInput = '',
  input = '',
  ajaxSearch = function() {
    $.ajax({
      url: "groups/search",
      type: "GET",
      data: ("title=" + input)
    });
  };
  ajaxIndex = function() {
    $.ajax({
      url: "groups/reset_index",
      type: "GET",
    });
  };
  $('#i_keyword_search').on('keyup', function() {
    input = $.trim($(this).val());
    if(input != ''){
      if(preInput !== input){
        clearTimeout(preFunc);
        preFunc = setTimeout(ajaxSearch, 500);
      }
    } else {
      console.log("fuga");
      ajaxIndex();
    }

    preInput = input;
    
  });

});

