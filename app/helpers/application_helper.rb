module ApplicationHelper

    def logged_in?
        !!session[:user_id]
    end

    def current_user
        @current_user ||= User.find_by_id(session["user_id"])
    end

    def redirect_if_not_logged_in
        redirect login_path if !logged_in?
    end

    def redirect_if_logged_in
        redirect root_path if logged_in?
    end
end
