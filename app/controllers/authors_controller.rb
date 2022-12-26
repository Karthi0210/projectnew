class AuthorsController < ApplicationController

  before_action :set_author, only: [:show, :edit, :update, :destroy]
  before_action :require_same_user, only: [:edit, :update, :destroy]
  before_action :require_admin, only: [:destroy]

  def index
    @authors = Author.paginate(page: params[:page], per_page: 5)
  end


  def new
    @author = Author.new
  end

  def create

    @author = Author.new(author_params)
    if @author.save
      session[:author_id] = @author.id
      flash[:success] = "Welcome #{@author.authorname} to Funreads App!"
      redirect_to author_path(@author)
     else
      render 'new'
     end
    end

    def show
      @author_books = @author.books.paginate(page: params[:page], per_page: 5)
    end

    def edit
    end
  
    def update
      if @author.update(author_params)
        flash[:success] = "Your account was updated successfully"
        redirect_to @author
      else
        render 'edit'
      end  
    end

    def destroy
      if !@chef.admin?
       @author.destroy
       flash[:danger] = "Author and all their associated books have been deleted"
       redirect_to authors_path
      end
    end

  private
  
  def author_params
    params.require(:author).permit(:authorname, :email, :password, :password_confirmation)
  end

  def set_author
    @author = Author.find(params[:id])
  end

   def require_same_user
      if current_author != @author and !current_author.admin?
        flash[:danger] = "You can only edit or delete your own account"
        redirect_to authors_path
      end
   end

   def require_admin
    if logged_in? & !current_author.admin?
      flash[:danger] = "Only admin users can perform that action"
      redirect_to root_path
    end
   end



end