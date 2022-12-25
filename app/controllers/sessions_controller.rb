class SessionsController < ApplicationController
  
  def new
  # will simply render the form
  end

  def create
   author = Author.find_by(email: params[:session][:email].downcase)
   if author && author.authenticate(params[:session][:password])
      session[:author_id] = author.id
      flash[:success] = "You have successfully logged in"
      redirect_to author
   else
      flash.now[:danger] = "There was something wrong with your login information"
      render 'new'
   end
  end


  def destroy
    session[:author_id] = nil
    flash[:success] = "You have logged out"
    redirect_to root_path
  end

end 