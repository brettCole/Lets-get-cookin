$(function() {
  // function for recipe show page
  $("#js-show_review").on("click", function(e) {
    e.preventDefault();

    $.get({
      // method: 'GET',
      url: this.href + ".json"
    }).success(function(response) {
      let $rating = $("#rating");
      let $review = $("#review");
      let $user = $("#user");
      let reviewCount = 0;

      $user.text("");
      $rating.text("");
      $review.text("");
      $user.prepend(response[reviewCount].user.name);
      $rating.append(response[reviewCount].rating);
      $review.append(response[reviewCount].review);

      $("#next_rating").on("click", function(e) {
        e.preventDefault();
        reviewCount++;
        if (response[reviewCount].rating !== "") {
          $user.text("");
          $rating.text("");
          $review.text("");
          $user.prepend(response[reviewCount].user.name);
          $rating.append(response[reviewCount].rating);
          $review.append(response[reviewCount].review);
        }
      });
      $("#previous_rating").on("click", function(e) {
        e.preventDefault();
        reviewCount--;
        if (response[reviewCount].rating !== "") {
          $user.text("");
          $rating.text("");
          $review.text("");
          $user.prepend(response[reviewCount].user.name);
          $rating.append(response[reviewCount].rating);
          $review.append(response[reviewCount].review);
        }
      });
    });
    $(".show_hide").removeClass("show_hide");
  });

  // function for favorites index
  $( window ).load(function() {
    $.get({
      url: window.location.href + ".json"
    }).success(function(response) {
      console.log(response);
      let $title = $("js-title");
      let reviewCount = 0;
    });
  });

});
