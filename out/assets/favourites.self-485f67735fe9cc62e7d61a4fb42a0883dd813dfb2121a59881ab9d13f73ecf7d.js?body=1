var favourites = (function($, window, document) {
  var init = function(settings){
    initFavouriteLocalStorage(settings.set);
    initFavouriteClasses(settings.set);
    initFavouriteClickListner();
  };

  var initFavouriteClickListner = function(){
    $("a.favourite-toggle").click(function(){
      addOrRemoveFavourite($(this), $(this).data('monster-set'), $(this).data('monster'));
    });
  };

  var initFavouriteLocalStorage = function(set_name){
    if (localStorage.hasOwnProperty('favourites') == false){
      localStorage.setItem('favourites', JSON.stringify({}));
    }
    var favs = JSON.parse(localStorage.getItem('favourites'));
    if (!(set_name in favs)){
      // XXX: hack for the 5esrd slug change
      if ('d&d5esrd' in favs){
        favs['5esrd'] = favs['d&d5esrd'];
        delete favs['d&d5esrd'];
      } else {
        favs[set_name] = [];
      }
      // XXX: end hack
      // favs[set_name] = [];
      localStorage.setItem('favourites', JSON.stringify(favs));
    }
  };

  var initFavouriteClasses = function(set){
    favs = getFavourites(set);
    $("[data-monster='" + favs.join("'],[data-monster='") + "']").addClass('faved');
  };

  var addOrRemoveFavourite = function(thisObj, set, monster){
    if (thisObj.hasClass('faved')){
      removeFavourite(thisObj, set, monster);
    } else {
      addFavourite(thisObj, set, monster);
    }
  };

  var addFavourite = function(thisObj, set, monster){
    favs = getFavourites(set);
    if ($.inArray(monster, favs) == -1){
      favs.push(monster);
      setFavourites(set, favs);

      thisObj.addClass('faved');
      if (typeof(ga) == 'function') {
        ga('send', {
          hitType: 'event',
          eventCategory: 'Favourites',
          eventAction: 'add',
          eventLabel: monster
        });
      }
    };
  };

  var removeFavourite = function(thisObj, set, monster){
    favs = getFavourites(set);
    var index = $.inArray(monster, favs);
    if (index > -1){
      favs.splice(index, 1);
      setFavourites(set, favs);
      
      thisObj.removeClass('faved');
      if (typeof(ga) == 'function') {
        ga('send', {
          hitType: 'event',
          eventCategory: 'Favourites',
          eventAction: 'remove',
          eventLabel: monster
        });
      }
    };
  };

  var getFavourites = function(set){
    // get the array of favourites for a particular set
    return JSON.parse(localStorage.getItem('favourites'))[set];
  }

  var setFavourites = function(set, favoritesArray){
    // write the array of favourites for a particular set
    all_favs = JSON.parse(localStorage.getItem('favourites'));
    all_favs[set] = favoritesArray;
    localStorage.setItem('favourites', JSON.stringify(all_favs));
  };

  return {
    init: init,
  };
})(jQuery, window, document);
