var filters = (function($, window, document) {
  var init = function(settings) {
    config = {
      monsterList: new List('monster-list', {
        valueNames: ['monster-name', 'monster-xp'],
        page: 350
      }),
    }

    initFilter();
    initMonsterSearch();
    initMonsterSort();
  };

  var initFilter = function() {
    var searchString = $('#search').val();
    monsterFilter(searchString);
    initSliders();
  };

  var initSliders = function() {
    var crFilterSlider = document.getElementById('cr-filter-slider');

    noUiSlider.create(crFilterSlider, {
      start: [ 0, 15 ],
      behaviour: 'tap',
      connect: true,
      range: {
        'min':  0,
        'max':  15
      },
      step: 1,
      format: {
        to: function(value){
          return Math.round(value);
        },
        from: function(value){
          return value;
        }
      }
    });
    // bind slider update events to the right function
    crFilterSlider.noUiSlider.on('update', updateCrFilterSliderLabels);
  }

  var initMonsterSearch = function() {
    $('#search').on('keyup', function() {
      config.monsterList.search();
      config.monsterList.filter();
      var searchString = $(this).val();
      monsterFilter(searchString);
    });
  };

  var initMonsterSort = function() {
    config.monsterList.sort('monster-xp', { order: 'asc' });
  }

  var updateCrFilterSliderLabels = function(values, handle, unencoded, tap, positions){
    var h = $('div[data-handle="'+handle+'"]');
    h.html(values[handle]);
  }

  var monsterFilter = function(searchString) {
    if (searchString.includes('-')) {

      var xpMinMax = searchString.split(' - ');
      var results = config.monsterList.filter(function(monster) {
        return (parseInt(monster.values()['monster-xp']) >= xpMinMax[0] && parseInt(monster.values()['monster-xp']) <= xpMinMax[1]);
      });
    } else {
      var results = config.monsterList.search(searchString);
    }

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

