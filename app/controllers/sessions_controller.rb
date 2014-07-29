class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      # Sign the user in and redirect to the user's show page.
    else
      flash[:error] = 'Невірна комбінація email/пароль' # Not quite right!
      render 'new'
    end
  end

  def destroy
  end
end
