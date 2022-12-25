class AuthorsController < ApplicationController
  
  def new
    @author = Author.new
  end

  def create

    @author = Author.new(author_params)
    if @author.save
      flash[:success] = "Welcome #{@author.authorname} to Funreads App!"
      redirect_to author_path(@author)
     else
      render 'new'
     end
    end

    def show

    end

  private
  
  def author_params
    params.require(:author).permit(:authorname, :email, :password, :password_confirmation)
  end



end