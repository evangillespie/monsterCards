var announcements = (function($, window, document){
  var init = function(id){
    if (doShowAnnouncement(id) == true){
      $("#announcement").show();
      $("a#dismiss-announcement").click(function(){
        dismissAnnouncement(id);
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

  var dismissAnnouncement = function(id){
    if (localStorage.hasOwnProperty('announcement-dismiss') == false){
      localStorage.setItem('announcement-dismiss', JSON.stringify({}));
    }
    var dismissed = JSON.parse(localStorage.getItem('announcement-dismiss'));
    var dis_date = new Date();
    dis_date.setDate(dis_date.getDate() + 3);

    dismissed[Number(id)] = dis_date;
    localStorage.setItem('announcement-dismiss', JSON.stringify(dismissed));
    $("#announcement").hide();
  };

  return {
      init: init,
    };
})(jQuery, window, document);