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
      $rating.append(response[0].rating);
      $review.append(response[0].review);

      $("#next_rating").on("click", function(e) {
        e.preventDefault();
        $rating.text("");
        $review.text("");
        $rating.append(response[1].rating);
        $review.append(response[1].review);
      });
    });
    $(".show_hide").removeClass("show_hide");
  });

});
