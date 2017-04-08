$(document).ready(function () {
  $('#challenge_completed').on('click', function(e) {
    e.preventDefault();
    $('#challenge_participants_buttons').removeClass('hide');
    $(this).addClass('hide');
  });


});
