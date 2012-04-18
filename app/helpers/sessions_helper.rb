module SessionsHelper
  def sign_in(member)
    if params[:session] && params[:session][:remember_me].to_i == 1
      cookies.permanent.signed[:remember_token] = [member.id, member.salt]
    else
      cookies.signed[:remember_token] = [member.id, member.salt]
    end
    self.current_member = member
  end

  def current_member=(member)
    @current_member = member
  end

  def current_member
    @current_member ||= member_from_remember_token
  end

  def signed_in?  
    !current_member.nil?
  end

  def sign_out
    cookies.delete(:remember_token)
    self.current_member = nil
  end

  def current_member?(member)
    member == current_member
  end

  def authenticate
    deny_access unless signed_in?
  end

  def deny_access
    store_location
    redirect_to signin_path, :notice => "Please sign in to access this page."
  end

  def redirect_back_or(default)
    redirect_to(session[:return_to] || default)
    clear_return_to
  end

  private

    def member_from_remember_token
      Member.authenticate_with_salt(*remember_token)
    end

    def remember_token
      cookies.signed[:remember_token] || [nil, nil]
    end

    def store_location
      session[:return_to] = request.fullpath
    end

    def clear_return_to
      session[:return_to] = nil
    end
end

