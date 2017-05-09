$(function() {

  $("#show_review").on("click", function(e) {
    e.preventDefault();

    $.ajax({
      method: 'GET',
      url: this.href,
    }).done(function(response) {
      console.log(response);
    });
  });

});
