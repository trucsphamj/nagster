module SessionsHelper
  def sign_in(member)
    cookies.permanent.signed[:remember_token] = [member.id, member.salt]
    self.current_member = member
  end

  def current_member=(member)
    @current_member = member
  end

  def current_member
    @current_membere ||= member_from_remember_token
  end

  def signed_in?  
    !current_member.nil?
  end

  def sign_out
    cookies.delete(:remember_token)
    self.current_member = nil
  end

  private

    def member_from_remember_token
      Member.authenticate_with_salt(*remember_token)
    end

    def remember_token
      cookies.signed[:remember_token] || [nil, nil]
    end
end

