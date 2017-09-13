var favourites = (function($, window, document) {
  var init = function(settings){
    initFavouriteLocalStorage();
    initFavouriteClasses();
    initFavouriteClickListner();
  };

  var initFavouriteClickListner = function(){
    $("a.favourite-toggle").click(function(){
      addOrRemoveFavourite($(this), $(this).data('monster-set'), $(this).data('monster'));
    });
  };

  var initFavouriteLocalStorage = function(){
    if (localStorage.hasOwnProperty('favourites') == false){
      localStorage.setItem('favourites', JSON.stringify({}));
    }
  };

  var initFavouriteClasses = function(){

    // @TODO: get the set dynamically
    var set = "d&d5esrd";
    favs = getFavourites(set);

    // console.time("second");
    var selector = '';
    for(i=0; i < favs.length; i++){
      selector += '[data-monster="'+favs[i]+'"],';
    }
    $(selector.slice(0, -1)).addClass('bg-gold');
    // console.timeEnd("second");
  };

  var addOrRemoveFavourite = function(thisObj, set, monster){
    if (thisObj.hasClass('bg-gold')){
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

      thisObj.addClass('bg-gold');
    };
  };

  var removeFavourite = function(thisObj, set, monster){
    favs = getFavourites(set);
    var index = $.inArray(monster, favs);
    if (index > -1){
      favs.splice(index, 1);
      setFavourites(set, favs);
      
      thisObj.removeClass('bg-gold');
    };
  };

  var getFavourites = function(set){
    // get the array of favourites for a particular set
    favs = JSON.parse(localStorage.getItem('favourites'));
    if (!(set in favs)){
      favs[set] = [];
    }
    return favs[set];
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