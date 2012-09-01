module SessionsHelper
  
  def sign_in(coworker)
    cookies.permanent[:remember_token] = coworker.remember_token
    self.current_coworker = coworker
  end
  
  def signed_in?
    !current_coworker.nil?
  end
  
  def sign_out
    self.current_coworker = nil
    cookies.delete(:remember_token)
  end
  
  def current_coworker=(coworker)
    @current_coworker = cowoker
  end
  
  def current_coworker
    @current_coworker ||= Coworker.find_by_remember_token(cookies[:remember_token])
  end
end
