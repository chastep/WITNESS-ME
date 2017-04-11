
// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree ./channels
//= require_tree .

$(document).ready(function () {
  $('.challenge-content').on('click', function(e) {
    e.preventDefault();
    var listItem = $(this).closest('li');
    console.log(listItem);
    var challengeID = listItem.attr("id");
    console.log(challengeID);
    location.replace("/challenges/" + challengeID);
  });

  $('#challenge_completed').on('click', function(e) {
    e.preventDefault();
    $('#challenge_participants_buttons').removeClass('hide');
    $(this).addClass('hide');
  });

});

