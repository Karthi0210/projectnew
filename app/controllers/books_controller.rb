class BooksController <ApplicationController

	before_action :set_book , only: [:show, :edit, :update, :destroy]
	before_action :require_user, except: [:index, :show]
    before_action :require_same_user, only: [:edit, :update, :destroy]

	def index
		@books = Book.paginate(page: params[:page], per_page: 5)
	end

	def show
		
	end

	def new
		@book = Book.new
	end

	def create
		@book = Book.new(book_params)
		@book.author = current_author  
		if @book.save
			flash[:success] = "Book was created successfully"
            redirect_to book_path(@book)
		else
			render 'new'
		end
	end

	def edit
		
	end

	def update
		if @book.update(book_params)
			 flash[:success] = "Book was updated successfully!"
             redirect_to book_path(@book)
		else
			render 'edit'
		end
	end

	def destroy
		Book.find(params[:id]).destroy
		flash[:success] = "Book deleted successfully!"
		redirect_to books_path
	end

	private


	   def set_book
	   	@book = Book.find(params[:id])
	   end

	   def  book_params
	   	params.require(:book).permit(:name, :description)
       end

       def require_same_user
        if current_author != @book.author
          flash[:danger] = "You can only edit or delete your own books"
          redirect_to books_path
        end  
       end

end