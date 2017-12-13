var filters = (function($, window, document) {
  var init = function(settings) {
    config = {
      crXp: settings.crXp,
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

  var updateCrFilterSliderLabels = function(values, handle, unencoded, tap, positions){
    if (values[handle] == 15)
      var val = "15+";
    else
      var val = values[handle];
    $('div[data-handle="'+handle+'"]').html(val);
    monsterFilterByCr(values);
  }

  var monsterFilter = function(searchString) {
    var results = config.monsterList.search(searchString);

    if (results.length == 0) {
      $('#monster-list-empty').show();
    } else {
      $('#monster-list-empty').hide();
    }
  };

  var monsterFilterByCr = function(values) {
    var xpMinMax = values.map(function(value) { return config.crXp[value] });
    var results = config.monsterList.filter(function(monster) {
      return (parseInt(monster.values()['monster-xp']) >= xpMinMax[0] && parseInt(monster.values()['monster-xp']) <= xpMinMax[1]);
    });

    if (results.length == 0) {
      $('#monster-list-empty').show();
    } else {
      $('#monster-list-empty').hide();
    }
  }

  return {
    init: init,
  };
})(jQuery, window, document);

