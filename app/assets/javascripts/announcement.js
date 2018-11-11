var announcements = (function($, window, document){
  var init = function(id){
    if (canShowAnnouncement(id) == true){
      $("div#announcement").show();
      $("a#dismiss-announcement").click(function(){
        dismissAnnouncement(id);
      });
    }
  };

  var canShowAnnouncement = function(id){
    if (sessionStorage.hasOwnProperty('announcement-dismiss')){
      var dismissed = JSON.parse(sessionStorage.getItem('announcement-dismiss'));
      if ($.inArray(Number(id), dismissed) != -1) {
        return false;
      }
    }
    return true;
  };

  var dismissAnnouncement = function(id){
    if (sessionStorage.hasOwnProperty('announcement-dismiss') == false){
      sessionStorage.setItem('announcement-dismiss', JSON.stringify([]));
    }
    var dismissed = JSON.parse(sessionStorage.getItem('announcement-dismiss'));
    dismissed.push(Number(id));
    sessionStorage.setItem('announcement-dismiss', JSON.stringify(dismissed));
    $("div#announcement").hide();
  };

  return {
      init: init,
    };
})(jQuery, window, document);