$(document).ready(function () {

  window.fbAsyncInit = function() {
    FB.init({
      appId      : '190909778091031',
      xfbml      : true,
      version    : 'v2.8'
    });
    FB.AppEvents.logPageView();
  };
  (function(d, s, id){
     var js, fjs = d.getElementsByTagName(s)[0];
     if (d.getElementById(id)) {return;}
     js = d.createElement(s); js.id = id;
     js.src = "//connect.facebook.net/en_US/sdk.js";
     fjs.parentNode.insertBefore(js, fjs);
   }(document, 'script', 'facebook-jssdk'));

  $('#shareBtn').on('click', function(e) {
    e.preventDefault();
    var challengeOutcome = $('#outcome').text()
    FB.ui({
      method: 'share',
      display: 'popup',
      href: window.location.href,
      outcome: challengeOutcome
    }, function(response){});

  });

});
