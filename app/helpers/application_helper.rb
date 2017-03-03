module ApplicationHelper
  def which_layout
    if current_page?(:controller => "users", :action => "new")
    elsif !logged_in?
      render "layouts/login"
    else
      render "layouts/logout"
    end
  end
end
