// function for favorites index
// $(window).on("load", function() {
//   $.getJSON({
//     url: window.location.href + ".json"
//   }).success(function(response) {
//     // let $title = $( ".js-title" );
//     let reviewCount = 0;
//
//     while (reviewCount < $title.length) {
//       let recipe_title = response[reviewCount].recipe.title;
//       let recipe_id = response[reviewCount].recipe.id;
//
//       $title.eq(reviewCount).prepend($("<a>")
//         .text(`${ response[reviewCount].recipe.title }`)
//         .attr("href", `/recipes/${recipe_id}`));
//       reviewCount++;
//     }
//   });
// });

// function for favorites index
function favoritesIndex() {
  $.getJSON({
    url: window.location.href + ".json"
  }).success(function(response) {
    let $title = $(".js-title");
    for (var i = 0; i < $title.length, i++;) {
      let recipe_title = response[i].recipe.title;
      let recipe_id = response[i].recipe.id;

      $title.eq(i).prepend($("<a>")
        .text(`${ response[i].recipe.title }`)
        .attr("href", `/recipes/${recipe_id}`));
  }
});
}
$(favoritesIndex);
