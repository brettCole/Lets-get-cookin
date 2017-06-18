// function for recipe show page - Show Reviews Link
function showReview() {
  $("#js-show_review").on("click", function(e) {
    e.preventDefault();
    const url = this.href;

    fetch(`${ url }.json`, {
        method: 'GET',
        credentials: 'same-origin',
        headers: {
          'Accept': 'application/json',
        },
      })
      .then((response) => response.json())
      .then(data => {
        let reviewCount = 0;

        $("#user").empty().prepend(data[reviewCount].user.name);
        $("#rating").empty().append(data[reviewCount].rating);
        $("#review").empty().append(data[reviewCount].review);

        nextReview();

        $(".show_hide").removeClass("show_hide");
      });
  });
}

// next / previous ratings function for recipe show page
function nextReview() {
  const url = $("#js-show_review").attr("href");
  let reviewCount = 0;
  const $rating = $("#rating");
  const $review = $("#review");
  const $user = $("#user");

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

    $.post({
      url: this.action,
      data: $(this).serialize()
    }).success(function(response) {

      $("#user").empty().prepend(response.user.name);
      $("#rating").empty().prepend(response.rating);
      $("#review").empty().prepend(response.review);

      $(".show_hide").removeClass("show_hide");
      $("#hidden_recipe_field").hide();

      nextReview();
    });
  });
}

function recipeIngredientsResponse() {
  const recipeDetails = $("#show_recipe_details");
  if (recipeDetails) {
    const url = window.location.href;

    fetch(`${ url }.json`, {
        method: 'GET',
        credentials: 'same-origin',
        headers: {
          'Accept': 'application/json',
        },
      })
      .then((response) => response.json())
      .then(data => {
        const recipe = new Recipe(data);
        const totalAmount = recipe.ingredientTotal(data);

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
            ${ recipe.quantity[0][i].quantity } ${ recipe.name[0][i].name }
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
}

function addIngredient() {
  let index = 1;

  $("#add_ingredient").on("click", function(e) {
    e.preventDefault();

    const formField =
      `<div class="fluid field">
        <label for='recipe_ingredients_attributes_${ index + 1 }_quantity'>Quantity</label>
        <input type='text' name='recipe[ingredients_attributes][${ index + 1 }][quantity]'><br>
        <label for='recipe_ingredients_attributes_${ index + 1 }_Ingredient'>Ingredient ${ index + 1 }</label>
        <input type='text' name='recipe[ingredients_attributes][${ index + 1 }][name]' id='recipe_ingredients_attributes__${ index + 1 }_name'>
      </div><br>`;
      index++;

    $('#parent_add_ingredient').append(formField);
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

$(function() {
  "use strict";

  recipeIngredientsResponse();
  showReview();
  revealForm();
  addIngredient();
});
