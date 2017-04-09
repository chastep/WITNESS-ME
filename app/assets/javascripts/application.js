$(document).ready(function () {
  $('.card-content').on('click', function(e) {
    e.preventDefault();
    var listItem = $(this).closest('li');
    console.log(listItem);
    var challengeID = listItem.attr("id");
    console.log(challengeID);
    location.replace("/challenges/" + challengeID);
  });


});
