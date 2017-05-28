$( function() {

  // variables for recipe reviews on recipe show page
  let $rating = $( "#rating" );
  let $review = $( "#review" );
  let $user = $( "#user" );
  let reviewCount = 0;

  //  variables for user favorite recipe index
  let $title = $( ".js-title" );

  var showGetReviewUrl = $( "#js-show_review" ).attr( 'href' ) + ".json";

  // function for recipe show page
  function testingFunction() {
    $( "#js-show_review" ).on( "click", function( e ) {
    e.preventDefault();

    $.get({
      url: this.href + ".json"
    }).success( function( response ) {
      debugger
      // let $rating = $( "#rating" );
      // let $review = $( "#review" );
      // let $user = $( "#user" );
      // let reviewCount = 0;
      $user.text( "" );
      $rating.text( "" );
      $review.text( "" );
      $user.prepend( response[reviewCount].user.name );
      $rating.append( response[reviewCount].rating );
      $review.append( response[reviewCount].review );

      nextReview();
      // $( "#next_rating" ).on( "click", function( e ) {
      //   e.preventDefault();
      //   reviewCount++;
      //   if ( response[reviewCount].rating !== "" ) {
      //     $user.text( "" );
      //     $rating.text( "" );
      //     $review.text( "" );
      //     $user.prepend( response[reviewCount].user.name );
      //     $rating.append( response[reviewCount].rating );
      //     $review.append( response[reviewCount].review );
      //   }
      // });

      $( "#previous_rating" ).on( "click", function( e ) {
        e.preventDefault();
        reviewCount--;
        if ( response[reviewCount].rating !== "" ) {
          $user.text( "" );
          $rating.text( "" );
          $review.text( "" );
          $user.prepend( response[reviewCount].user.name );
          $rating.append( response[reviewCount].rating );
          $review.append( response[reviewCount].review );
        }
      });
    });
    $( ".show_hide" ).removeClass( "show_hide" );
  });
}
testingFunction();

function nextReview() {
  $.get({
    url: showGetReviewUrl
  }).success( function( response ) {
$( "#next_rating" ).on( "click", function( e ) {
  e.preventDefault();
  reviewCount++;
  if ( response[reviewCount].rating !== "" ) {
    // $user.text( "" );
    $user.empty().prepend( response[reviewCount].user.name);
    $rating.empty().append( response[reviewCount].rating );
    $review.empty().append( response[reviewCount].review);
  }
});
});
}


//   let reviewGetRequest = function() {
//     $( "#js-show_review" ).on( "click", function( e ) {
//     e.preventDefault();
//
//     $.get({
//       url: this.href + ".json"
//     }).success( function( response ) {
//       reviewResponse = response;
//       debugger;
//       // let $rating = $( "#rating" );
//       // let $review = $( "#review" );
//       // let $user = $( "#user" );
//       // let reviewCount = 0;
//       $user.text( "" );
//       $rating.text( "" );
//       $review.text( "" );
//       $user.prepend( response[reviewCount].user.name );
//       $rating.append( response[reviewCount].rating );
//       $review.append( response[reviewCount].review );
//     });
//       $( ".show_hide" ).removeClass( "show_hide" );
//   });
// }
//     reviewGetRequest();
//
//     let reviewResponse;
//
//
//       $( "#next_rating" ).on( "click", function( reviewResponse ) {
//         reviewResponse.preventDefault();
//         debugger;
//
//
//         reviewCount++;
//         if ( response[reviewCount].rating !== "" ) {
//           $user.text( "" );
//           $rating.text( "" );
//           $review.text( "" );
//           $user.prepend( response[reviewCount].user.name );
//           $rating.append( response[reviewCount].rating );
//           $review.append( response[reviewCount].review );
//         }
//       });



  // function for favorites index
  $( window ).on( 'load', function() {
    $.getJSON({
      url: window.location.href + ".json"
    }).success( function( response ) {
      // let $title = $( ".js-title" );
      // let reviewCount = 0;

      while( reviewCount < $title.length ) {
        let recipe_title = response[reviewCount].recipe.title;
        let recipe_id = response[reviewCount].recipe.id;

        $title.eq(reviewCount).prepend($('<a>')
          .text(`${ response[reviewCount].recipe.title }`)
          .attr('href', `/recipes/${recipe_id}`));
        reviewCount++;
      }
    });
  });

  // function to reveal rating form
  $("div:contains('Write Review')").on('click', function(e) {
    e.preventDefault();
    $("#hidden_recipe_field").show();
    $("html, body").scrollTop( $(document).height() );
  });

  // // function to post via ajax post
  $("#new_rating").on('submit', function(e) {
    e.preventDefault();
    let rating_url = this.action;
    let form_data = $(this).serialize();
    console.log(form_data);

    $.post({
      url: rating_url,
      data: form_data
    }).success( function(response) {
      let recipe_user = response.user.name;
      let recipe_rating = response.rating;
      let recipe_review = response.review;
      let $rating = $( "#rating" );
      let $review = $( "#review" );
      let $user = $( "#user" );

      $user.text( "" );
      $rating.text( "" );
      $review.text( "" );
      $user.prepend( recipe_user );
      $rating.prepend( recipe_rating );
      $review.prepend( recipe_review );

      $( ".show_hide" ).removeClass( "show_hide" );

      nextReview();
    });
  });
});
