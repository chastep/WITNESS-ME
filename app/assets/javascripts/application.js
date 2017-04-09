$(document).ready(function () {
  $('.card-content').on('click', function(e) {
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

  // $('.winner').on('submit', function(e) {
  //   e.preventDefault();
  //   debugger
  //   var url = $(this).attr("action");
  //   var winnerID = $(this).attr("id");
  //   var ajaxFunc = $.ajax({
  //       url: url,
  //       method: 'PUT',
  //       data: {user: {winner_id: winnerID}}
  //     });

  //     ajaxFunc.done(function(response) {
  //       console.log(response);
  //       setTimeout(
  //         function() {
  //           location.replace("<%= challenge_path(@challenge) %>");
  //         }, 3000);
  //     });
  //     ajaxFunc.fail(function(response) {
  //       console.log("shits broke fam");
  //     });
  // });

});
