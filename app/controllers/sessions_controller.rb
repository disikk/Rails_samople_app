class SessionsController < ApplicationController
  def new

  end

  def create
    user = User.find_by_email(params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      flash[:success] = 'Вход успешно выполнен.'
      redirect_to user
    else
      flash.now[:danger] = 'Некорректные логин и(или) пароль.'
      render 'new'
    end
  end

  def destroy

  end
end
