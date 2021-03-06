var announcements = (function($, window, document){
  // @TODO: rip out the announcement id and database stuff. Just hard code the rare annoucment
  var init = function(id){
    if (doShowAnnouncement(id) == true){
      $("#announcement").show();
      $("a#dismiss-announcement").click(function(){
        dismissAnnouncement(id, 3);
        $("#announcement").hide();
      });
    }
  };

  var doShowAnnouncement = function(id){
    if (localStorage.hasOwnProperty('announcement-dismiss')){
      var dismissed = JSON.parse(localStorage.getItem('announcement-dismiss'));
      if (Number(id) in dismissed){
        var dis_date = new Date(dismissed[Number(id)]);
        var now = new Date();
        if (dis_date > now){
          return false;
        }
      }
    }
    return true;
  };

  var dismissAnnouncement = function(id, dismiss_days){
    if (localStorage.hasOwnProperty('announcement-dismiss') == false){
      localStorage.setItem('announcement-dismiss', JSON.stringify({}));
    }
    var dismissed = JSON.parse(localStorage.getItem('announcement-dismiss'));
    var dis_date = new Date();
    dis_date.setDate(dis_date.getDate() + dismiss_days);

    dismissed[Number(id)] = dis_date;
    localStorage.setItem('announcement-dismiss', JSON.stringify(dismissed));
  };

  return {
      init: init,
    };
})(jQuery, window, document);