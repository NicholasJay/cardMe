class SessionController < ApplicationController

  # def new
  # end

  def create
    # find if any user has that email
    user = User.find_by(email: params[:email])

    # if that user exists and it has a password that was sent
    if user && ( user.authenticate(params[:password]) )
      #save the user_id in the session hash
      session[:user_id] = user.id
      #redirect to user show page
      
      respond_to do |format|
        format.json do
          render json: {success: true, id: session[:user_id]}
        end
        format.html do
          redirect_to ( user_path (user) )
        end
      end
    else
      flash[:message] = "This email and password combination does not exist."
      
      respond_to do |format|
        format.json do
          render json: {success: false, message: flash[:message]}
        end
        format.html do
          redirect_to root_path
        end
      end
    end
  end


  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end
end