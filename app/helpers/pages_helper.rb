module PagesHelper
  def which_layout
    if !logged_in?
      render "layouts/login"
    else
      render "layouts/logout"
    end
  end
end
