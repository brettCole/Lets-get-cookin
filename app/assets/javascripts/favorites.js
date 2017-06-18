function favoritesIndex() {
  const favIndex = document.getElementById("favorites_index");
  if (favIndex) {
    let url = window.location.href;
    fetch(`${ url }.json`, {
        method: 'GET',
        credentials: 'same-origin',
        headers: {
          'Accept': 'application/json',
        },
      })
      .then(response => response.json())
      .then(data => {
        const $title = $(".js-title");
        let i = 0;

        while (i < $title.length) {
          let recipe_title = data[i].recipe.title;
          let recipe_id = data[i].recipe.id;

          $title.eq(i).prepend($("<a>")
            .text(`${ data[i].recipe.title }`)
            .attr("href", `/recipes/${ recipe_id }`));
          i++;
        }
      })
      .catch(function() {
        alert("Sorry for the inconvenience, but we are having trouble displaying your favorites. While we work this out, go create a recipe!");
      });
  }
}

$(function() {
  favoritesIndex();
});
