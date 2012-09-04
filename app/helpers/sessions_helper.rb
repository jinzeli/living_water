# -*- encoding : utf-8 -*-
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
    @current_coworker = coworker
  end
  
  def current_coworker
    @current_coworker ||= Coworker.find_by_remember_token(cookies[:remember_token])
  end
  
  def current_coworker?(coworker)
    coworker == current_coworker
  end
  
  def redirect_back_or(default)
    redirect_to(session[:return_to] || default)
    session.delete(:return_to)
  end

  def store_location
    session[:return_to] = request.url
  end
  
    def signed_in_coworker
        store_location
        redirect_to signin_url, notice: "要先登入哦～" unless signed_in?
    end
    
    def correct_coworker
      @coworker = Coworker.find(params[:id])
      if (!admin_coworker?)
        redirect_to(root_path) unless current_coworker?(@coworker)
      end
    end
    
    def admin_coworker
      redirect_to(root_path) unless current_coworker.admin?
    end
    
    def admin_coworker?
      current_coworker.admin?
    end
    
    def core_coworker
      redirect_to(root_path) unless current_coworker.core_coworker?
    end
    
    def core_coworker?
      current_coworker.core_coworker?
    end
end
