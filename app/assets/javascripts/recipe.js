$( function() {
  // function for recipe show page
  $( "#js-show_review" ).on( "click", function( e ) {
    e.preventDefault();

    $.get({
      url: this.href + ".json"
    }).success( function( response ) {
      let $rating = $( "#rating" );
      let $review = $( "#review" );
      let $user = $( "#user" );
      let reviewCount = 0;

      $user.text( "" );
      $rating.text( "" );
      $review.text( "" );
      $user.prepend( response[reviewCount].user.name );
      $rating.append( response[reviewCount].rating );
      $review.append( response[reviewCount].review );

      $( "#next_rating" ).on( "click", function( e ) {
        e.preventDefault();
        reviewCount++;
        if ( response[reviewCount].rating !== "" ) {
          $user.text( "" );
          $rating.text( "" );
          $review.text( "" );
          $user.prepend( response[reviewCount].user.name );
          $rating.append( response[reviewCount].rating );
          $review.append( response[reviewCount].review );
        }
      });
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

  // function for favorites index
  $( window ).on( 'load', function() {
    $.getJSON({
      url: window.location.href + ".json"
    }).success( function( response ) {
      let $title = $( ".js-title" );
      let reviewCount = 0;

      while( reviewCount < $title.length ) {
        let recipe_title = response[reviewCount].recipe.title;
        let recipe_id = response[reviewCount].recipe.id;

        $title.eq(reviewCount).prepend($('<a>')
          .text(`${ response[reviewCount].recipe.title }`)
          .attr('href', `/recipes/${recipe_id}`));
        reviewCount++;
      }
    });
  })

  // function to reveal rating form and post/json
  $("div:contains('Write Review')").on('click', function(e) {
    e.preventDefault();
    $("#hidden_recipe_field").show();
    $("html, body").scrollTop( $(document).height() );
  });

});
