var monsters = (function($, window, document) {
  var init = function(settings) {
    config = {
      monsterList: new List('monster-list', {
        valueNames: ['monster-name', 'monster-xp'],
        page: 350
      }),
    }

    initFilter();
    initMonsterSearch();
  };

  var initFilter = function() {
    var searchString = $('#search').val();
    monsterFilter(searchString);
  };

  var initMonsterSearch = function() {
    $('#search').on('keyup', function() {
      var searchString = $(this).val();
      monsterFilter(searchString);
    });
  };

  var monsterFilter = function(searchString) {
    var results = config.monsterList.search(searchString);
    if (results.length == 0) {
      $('#monster-list-empty').show();
    } else {
      $('#monster-list-empty').hide();
    }
  };

  return {
    init: init,
  };
})(jQuery, window, document);

