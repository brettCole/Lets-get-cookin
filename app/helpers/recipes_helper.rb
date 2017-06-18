module RecipesHelper
  def if_logged_in_options
    if !logged_in?
      link_to 'Login to Create Review', new_session_path, class: 'ui right floated button'
    elsif current_user != @recipe.user.id
      link_to 'Write Review', new_recipe_rating_path(@recipe), class: 'ui right floated button'
    end
  end
end
