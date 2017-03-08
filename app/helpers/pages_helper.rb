module PagesHelper
  # def which_layout
  #   if current_page?(:controller => "users", :action => "new") || current_page?(:controller => "sessions", :action => "new")
  #   elsif !logged_in?
  #     render "layouts/login"
  #   else
  #     render "layouts/logout"
  #   end
  # end
  def which_layout
    if !logged_in?
      render "layouts/login"
    else
      render "layouts/logout"
    end
  end
end
