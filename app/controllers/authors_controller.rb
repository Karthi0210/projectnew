class AuthorsController < ApplicationController
  

  def index
    @authors = Author.paginate(page: params[:page], per_page: 5)
  end


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
      @author = Author.find(params[:id])
      @author_books = @author.books.paginate(page: params[:page], per_page: 5)
    end

    def edit
      @author = Author.find(params[:id])
    end
  
    def update
      @author = Author.find(params[:id])
      if @author.update(author_params)
        flash[:success] = "Your account was updated successfully"
        redirect_to @author
      else
        render 'edit'
      end  
    end

  private
  
  def author_params
    params.require(:author).permit(:authorname, :email, :password, :password_confirmation)
  end



end