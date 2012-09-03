# -*- encoding : utf-8 -*-
class SessionsController < ApplicationController
  def new
    if signed_in?
      redirect_to current_coworker
    end
  end
  
  def create
    coworker = Coworker.find_by_email(params[:session][:email].downcase)
    if coworker && coworker.authenticate(params[:session][:password])
      sign_in coworker
      redirect_to coworker
      flash[:success] = '欢迎来到 爱服事 | iMinistry！'
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
