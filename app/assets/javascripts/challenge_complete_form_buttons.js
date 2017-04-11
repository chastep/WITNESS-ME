$(document).ready(function () {
  $('#challenge_completed').on('click', function(e) {
    debugger
    e.preventDefault();
    $('#challenge_participants_buttons').removeClass('hide');
    $(this).addClass('hide');
  });

  $('#challenge_participants_buttons').on('submit', 'form', function(e) {
    e.preventDefault();
    debugger
    var divItem = $(this).closest('div');
    var winnerID = divItem.attr("id");
    var ajaxFunc = $.ajax({
        url: "<%= challenge_path(@challenge) %>",
        method: 'PUT',
        dataType: 'json',
        data: {user: {winner_id: winnerID}}
      });

      ajaxFunc.done(function(response) {
        console.log(response);
        setTimeout(
          function() {
            location.replace("<%= challenge_path(@challenge) %>");
          }, 3000);
      });
      ajaxFunc.fail(function(response) {
        console.log("shits broke fam");
      });
  });

});
