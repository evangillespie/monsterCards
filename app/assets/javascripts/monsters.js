var monsters = (function($, window, document) {
  var init = function(settings) {
    initMonsterSearch();
  };

  var initMonsterSearch = function() {
    var options = { valueNames: ['monster-name'] }
    var listObj = new List('monster-list', options);
    $('#search').on('keyup', function() {
      var searchString = $(this).val();
      listObj.search(searchString);
    });
  };

  return {
    init: init,
  };
})(jQuery, window, document);

