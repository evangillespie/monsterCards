var favourites = (function($, window, document) {
  var init = function(settings){
    initFavouriteClickListner();
  };

  var initFavouriteClickListner = function(){
    $("a.favourite").click(function(){
      addOrRemoveFavourite($(this).data('monster-set'), $(this).data('monster'));
    });
  };

  var addOrRemoveFavourite = function(set, monster){
    // @TODO: move this somewhere else
    if (localStorage.hasOwnProperty('favourites') == false){
      var a = {};
      a[set] = [];
      localStorage.setItem('favourites', JSON.stringify(a));
    }

    favs = JSON.parse(localStorage.getItem('favourites'));
    if (!(set in favs)){
      favs[set] = [];
    }
    favs[set].push(monster);

    localStorage.setItem('favourites', JSON.stringify(favs));
  };

  return {
    init: init,
  };
})(jQuery, window, document);