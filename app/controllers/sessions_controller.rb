# -*- encoding : utf-8 -*-
class SessionsController < ApplicationController
  def new
  end
  
  def create
    coworker = Coworker.find_by_email(params[:session][:email].downcase)
    if coworker && coworker.authenticate(params[:session][:password])
      
    else
      flash.now[:error] = 'Email和Password的组合不太对哦～'
      render 'new'
    end
  end
  
  def destroy
    sign_out
    redirect_to root_url
  end
end
