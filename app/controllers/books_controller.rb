class BooksController <ApplicationController

	def index
		@books = Book.all
	end

	def show
		@book = Book.find(params[:id])
	end

	def new
		@book = Book.new
	end

	def create
		@book = Book.new(book_params)
		@book.author = Author.first  
		if @book.save
			flash[:success] = "Book was created successfully"
            redirect_to book_path(@book)
		else
			render 'new'
		end
	end

	private

	   def  book_params
	   	params.require(:book).permit(:name, :description)
       end


end