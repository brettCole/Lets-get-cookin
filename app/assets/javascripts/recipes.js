
//   variables for recipe reviews on recipe show page
//   let $rating = $("#rating");
//   let $review = $("#review");
//   let $user = $("#user");
//   let reviewCount = 0;
//
//   variables for user favorite recipe index
//   let $title = $(".js-title");
//
//   let showGetReviewUrl = $("#js-show_review").attr("href") + ".json";
//
//   // function for recipe show page
//   function showReview() {
//     $("#js-show_review").on("click", function(e) {
//       e.preventDefault();
//
//       $.get({
//         url: this.href + ".json"
//       }).success(function(response) {
//         let $rating = $( "#rating" );
//         let $review = $( "#review" );
//         let $user = $( "#user" );
//         let reviewCount = 0;
//         $user.empty().prepend(response[reviewCount].user.name);
//         $rating.empty().append(response[reviewCount].rating);
//         $review.empty().append(response[reviewCount].review);
//
//         nextReview();
//       });
//       $(".show_hide").removeClass("show_hide");
//     });
//   }
//   showReview();
//
//   function nextReview() {
//     $.get({
//       url: showGetReviewUrl
//     }).success(function(response) {
//       $("#next_rating").on("click", function(e) {
//         e.preventDefault();
//         reviewCount++;
//         if (response[reviewCount].rating !== "") {
//           // $user.text( "" );
//           $user.empty().prepend(response[reviewCount].user.name);
//           $rating.empty().append(response[reviewCount].rating);
//           $review.empty().append(response[reviewCount].review);
//         }
//       });
//
//       $("#previous_rating").on("click", function(e) {
//         e.preventDefault();
//         reviewCount--;
//         if (response[reviewCount].rating !== "") {
//           $user.empty().prepend(response[reviewCount].user.name);
//           $rating.empty().append(response[reviewCount].rating);
//           $review.empty().append(response[reviewCount].review);
//         }
//       });
//     });
//   }

//   // function to reveal rating form
//   $("div:contains('Write Review')").on("click", function(e) {
//     e.preventDefault();
//     $("#hidden_recipe_field").show();
//     $("html, body").scrollTop($(document).height());
//   });
//
//   // // function to post via ajax post
//   $("#new_rating").on("submit", function(e) {
//     e.preventDefault();
//     let rating_url = this.action;
//     let form_data = $(this).serialize();
//     console.log(form_data);
//
//     $.post({
//       url: rating_url,
//       data: form_data
//     }).success(function(response) {
//       let recipe_user = response.user.name;
//       let recipe_rating = response.rating;
//       let recipe_review = response.review;
//       let $rating = $("#rating");
//       let $review = $("#review");
//       let $user = $("#user");
//
//       $user.text("");
//       $rating.text("");
//       $review.text("");
//       $user.prepend(recipe_user);
//       $rating.prepend(recipe_rating);
//       $review.prepend(recipe_review);
//
//       $(".show_hide").removeClass("show_hide");
//
//       nextReview();
//     });
//   });
//
//   function recipeIngredientsResponse() {
//     $(window).on("load", function() {
//       debugger;
//       $.getJSON({
//         url: window.location.href + ".json"
//       }).success(function(response) {
//         let recipe = new Recipe(response);
//
//         $("#recipe_title").append(recipe.title);
//         $("#recipe_description").append(recipe.description);
//         $("#recipe_prep_time").append(recipe.prep_time);
//         $("#recipe_cook_time").append(recipe.cook_time);
//         $("#recipe_directions").append(recipe.directions);
//           // debugger;
//         let totalAmount = recipe.ingredientTotal(response);
//         // debugger;
//         $("#total_amount").append(totalAmount);
//
//         for(var i = 0; i < response.ingredients.length; i++) {
//           // create html in es6 template for ingredients
//           // Recipe(response);
//           let ingredients =
//             `<h1 class="ui centered header">
//               ${recipe.quantity[0][i].quantity} ${recipe.name[0][i].name}
//             </h1>`;
//             // debugger;
//           $("#recipe_ingredients").append(ingredients);
//           // debugger;
//         }
//         if(response.gluten_free === true ) {
//           $("#checkmark").addClass("checkmark icon");
//         } else {
//           $("#checkmark").addClass("remove icon");
//         }
//         if(response.vegan === true)  {
//           $("#remove").addClass("checkmark icon");
//         } else {
//           $("#remove").addClass("remove icon");
//         }
//       });
//     });
//   }
//   recipeIngredientsResponse();
//
// });
//
// function Recipe(attributes) {
//   // Recipe details of object
//   this.title = attributes.title;
//   this.description = attributes.description;
//   this.prep_time = attributes.prep_time;
//   this.cook_time = attributes.cook_time;
//   this.directions = attributes.directions;
//   // Ingredients details of object
//   this.quantity = [attributes.recipe_ingredients];
//   this.name = [attributes.ingredients];
// }
//
// Recipe.prototype.ingredientTotal = function(attributes) {
//   return attributes.ingredients.length;
// };
//
// // function recipeIngredientsResponse() {
// //   $(window).on("load", function() {
// //     $.getJSON({
// //       url: window.location.href + ".json"
// //     }).success(function(response) {
// //       let recipe = new Recipe(response);
// //
// //       $("#recipe_title").append(recipe.title);
// //       $("#recipe_description").append(recipe.description);
// //       $("#recipe_prep_time").append(recipe.prep_time);
// //       $("#recipe_cook_time").append(recipe.cook_time);
// //       $("#recipe_directions").append(recipe.directions);
// //         // debugger;
// //       let totalAmount = recipe.ingredientTotal(response);
// //       // debugger;
// //       $("#total_amount").append(totalAmount);
// //
// //       for(var i = 0; i < response.ingredients.length; i++) {
// //         // create html in es6 template for ingredients
// //         // Recipe(response);
// //         let ingredients =
// //           `<h1 class="ui centered header">
// //             ${recipe.quantity[0][i].quantity} ${recipe.name[0][i].name}
// //           </h1>`;
// //           // debugger;
// //         $("#recipe_ingredients").append(ingredients);
// //         // debugger;
// //       }
// //       if(response.gluten_free === true ) {
// //         $("#checkmark").addClass("checkmark icon");
// //       } else {
// //         $("#checkmark").addClass("remove icon");
// //       }
// //       if(response.vegan === true)  {
// //         $("#remove").addClass("checkmark icon");
// //       } else {
// //         $("#remove").addClass("remove icon");
// //       }
// //     });
// //   });
// // }
// // recipeIngredientsResponse();


function favoritesIndex() {
  let url = window.location.href;
  fetch(`${url}.json`, {
    method: 'GET',
    credentials: 'same-origin',
    headers: {
      'Accept': 'application/json',
    },
  })
    .then((response) => response.json())
    .then(data => {
      let $title = $(".js-title");
      let i = 0;

      while (i < $title.length) {
        let recipe_title = data[i].recipe.title;
        let recipe_id = data[i].recipe.id;

        $title.eq(i).prepend($("<a>")
          .text(`${data[i].recipe.title}`)
          .attr("href", `/recipes/${recipe_id}`));
        i++;
      }
    })
    .catch(function() {
      alert("Sorry for the inconvenience, but we are having trouble displaying your favorites. While we work this out, go create a recipe!");
    });
}

// function for recipe show page - Show Reviews Link
function showReview() {
  $("#js-show_review").on("click", function(e) {
    e.preventDefault();

    let url = this.href;

    fetch(`${url}.json`, {
        method: 'GET',
        credentials: 'same-origin',
        headers: {
          'Accept': 'application/json',
        },
      })
      .then((response) => response.json())
      .then(data => {
        let $rating = $("#rating");
        let $review = $("#review");
        let $user = $("#user");
        let reviewCount = 0;
        $user.empty().prepend(data[reviewCount].user.name);
        $rating.empty().append(data[reviewCount].rating);
        $review.empty().append(data[reviewCount].review);

        nextReview();

        $(".show_hide").removeClass("show_hide");
      })
      .catch(function() {
        alert("Can not show recipe reviews at this time!")
      });
  });
}

// next / previous ratings function for recipe show page
function nextReview() {
  let url = $("#js-show_review").attr("href");
  let reviewCount = 0;
  let $rating = $("#rating");
  let $review = $("#review");
  let $user = $("#user");

  fetch(`${url}.json`, {
      method: 'GET',
      credentials: 'same-origin',
      headers: {
        'Accept': 'application/json',
      },
    })
    .then((response) => response.json())
    .then(data => {
      $("#next_rating").on("click", function(e) {
        e.preventDefault();
        reviewCount++;
        if (data[reviewCount].rating !== "") {
          // $user.text( "" );
          $user.empty().prepend(data[reviewCount].user.name);
          $rating.empty().append(data[reviewCount].rating);
          $review.empty().append(data[reviewCount].review);
        }
      });

      $("#previous_rating").on("click", function(e) {
        e.preventDefault();
        reviewCount--;
        if (data[reviewCount].rating !== "") {
          $user.empty().prepend(data[reviewCount].user.name);
          $rating.empty().append(data[reviewCount].rating);
          $review.empty().append(data[reviewCount].review);
        }
      });
    });
  }

function checkIfPageOne() {
  if(window.location.href.indexOf("favorites") > -1) {
    favoritesIndex();
  }
}

function checkIfPageTwo() {
  if(window.location.href.indexOf("recipes") > -1) {
    showReview();
  }
}

$(function() {
  "use strict";

  checkIfPageOne();
  checkIfPageTwo();
});
