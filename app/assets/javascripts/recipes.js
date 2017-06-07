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

// function to reveal rating form - Recipe Show Page
function revealForm() {
  $("div:contains('Write Review')").on("click", function(e) {
    e.preventDefault();
    $("#hidden_recipe_field").show();
    $("html, body").scrollTop($(document).height());
  });
  postFromForm();
}

// function to post via ajax post
function postFromForm() {
  $("#new_rating").on("submit", function(e) {
    e.preventDefault();
    let rating_url = this.action;
    let form_data = $(this).serialize();

    $.post({
      url: rating_url,
      data: form_data
    }).success(function(response) {

      $("#user").text("");
      $("#rating").text("");
      $("#review").text("");
      $("#user").prepend(response.user.name);
      $("#rating").prepend(response.rating);
      $("#review").prepend(response.review);

      $(".show_hide").removeClass("show_hide");
      $("#hidden_recipe_field").hide();

      nextReview();
    });
  });
}

function recipeIngredientsResponse() {
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
      let recipe = new Recipe(data);
      let totalAmount = recipe.ingredientTotal(data);

      $("#recipe_title").append(recipe.title);
      $("#recipe_description").append(recipe.description);
      $("#recipe_prep_time").append(recipe.prep_time);
      $("#recipe_cook_time").append(recipe.cook_time);
      $("#recipe_directions").append(recipe.directions);

      $("#total_amount").append(totalAmount);

      for (var i = 0; i < data.ingredients.length; i++) {
        // create html in es6 template for ingredients
        let ingredients =
          `<h1 class="ui centered header">
          ${recipe.quantity[0][i].quantity} ${recipe.name[0][i].name}
          </h1>`;
        $("#recipe_ingredients").append(ingredients);
      }
      if (data.gluten_free === true) {
        $("#checkmark").removeClass("remove").addClass("checkmark");
      }
      if (data.vegan === true) {
        $("#remove").removeClass("remove").addClass("checkmark");
      }
    });
}

// Recipe object
function Recipe(attributes) {
  // Recipe details of object
  this.title = attributes.title;
  this.description = attributes.description;
  this.prep_time = attributes.prep_time;
  this.cook_time = attributes.cook_time;
  this.directions = attributes.directions;
  // Ingredients details of object
  this.quantity = [attributes.recipe_ingredients];
  this.name = [attributes.ingredients];
}

Recipe.prototype.ingredientTotal = (attributes) => {
  return attributes.ingredients.length;
};

function checkIfPageOne() {
  if (window.location.href.indexOf("favorites") > -1) {
    favoritesIndex();
  }
}

function checkIfPageTwo() {
  if (window.location.href.indexOf("recipes") > -1) {
    recipeIngredientsResponse();
    showReview();
    revealForm();
  }
}

$(function() {
  "use strict";

  checkIfPageOne();
  checkIfPageTwo();
});
