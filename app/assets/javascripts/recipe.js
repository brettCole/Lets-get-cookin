$(function() {
  $("#show_review").on("click", function(e) {
    e.preventDefault();

    $.get({
      method: 'GET',
      url: this.href
    }).success(function(response) {
      // $(".try_this").html(response.rating);
      // debugger
      var $rating = $("#rating");
      var $review = $("#review");
      var $test = $("#test");
      var reviewCount = 0;

      $test.prepend(response[reviewCount].user.name);
      $rating.append(response[reviewCount].rating);
      $review.append(response[reviewCount].review);

      $("#next_rating").on("click", function(e) {
        e.preventDefault();
        reviewCount++;
        if (response[reviewCount].rating != "") {
          $test.text("");
          $rating.text("");
          $review.text("");
          $test.prepend(response[reviewCount].user.name);
          $rating.append(response[reviewCount].rating);
          $review.append(response[reviewCount].review);
        };
      });
    });
    $(".show_hide").removeClass("show_hide");
  });

});
