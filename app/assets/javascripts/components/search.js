//= require awesomplete

window.Search = {
  QUANTITY_ITEMS: 5,
  init: function(){
    this.lastSeatch = '';
    this.searchComplete = false;

    window.Search.awesomplete = new Awesomplete('.js-input-autocomplete', {
      minChars: 1
    });
    $('.js-input-autocomplete').on('keyup', function(){
      var that = this;
      clearTimeout(window.getResultsTimeout);
      window.getResultsTimeout = setTimeout(function(){
        window.Search.getResults.bind(that)();
      }, 300);
    });
    window.addEventListener('awesomplete-selectcomplete', this.finish);
  },

  getResults: function(){
    if (this.value === "" || window.Search.isLastSearch(this.value) || window.Search.searchComplete) {
      return false;
    }
    var list = [];
    $.ajax({
      type: 'GET',
      url: '/v1/clients?q='+this.value+'',
      contentType: "application/json; charset=utf-8",
      dataType: "json",
      success: function(data){
        $.map(data, function(item, index){
          if (index < window.Search.QUANTITY_ITEMS) {
            list.push({label:item.name, value: item.id});
          }
        });
        window.Search.awesomplete.list = list;
      }
    });
    window.Search.lastSearch = this.value;
  },

  isLastSearch: function(value) {
    return window.Search.lastSearch === value;
  },

  finish: function(data){
    if (data.text) {
      $('.js-input-autocomplete').val(data.text.label)
      $('.js-input-client-id').val(data.text.value);
    }
    window.Search.searchComplete = true;
    $('.form-search').submit();
  }
};

$(document).ready(function(){
  window.Search.init();
});
