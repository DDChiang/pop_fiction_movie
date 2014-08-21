class SessionsController < ApplicationController
  def create #user signs in. @current_user will be set to user later. 
    #NOTE: do not have @current_user as attr_accessor type.
        #bc need @current_user to abide by session sign in. See session helper
    user = User.find_by(email: params[:session][:email])
    if (user && user.authenticate(params[:session][:password]))
      sign_in user #in app/helpers/sessions_helper.rb
      #optional. can redirect anywhere
      redirect_to user
    else
      flash[:error] = 'Invalid email/pw combo'
      render 'new'
    end
  end

  def destroy #user signs out
    sign_out #in app/helpers/sessions_helper.rb
    redirect_to root_url
  end

end
