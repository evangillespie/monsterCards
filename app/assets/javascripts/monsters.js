var monsters = (function($, window, document) {
  var init = function(settings) {
    initMonsterSearch();
  };

  var initMonsterSearch = function() {
    var options = { valueNames: ['monster-name'], page: 350 }
    var listObj = new List('monster-list', options);
    $('#search').on('keyup', function() {
      var searchString = $(this).val();
      results = listObj.search(searchString);
      if (results.length == 0) {
        $('#monster-list-empty').show();
      } else {
        $('#monster-list-empty').hide();
      }
    });
  };

  return {
    init: init,
  };
})(jQuery, window, document);

