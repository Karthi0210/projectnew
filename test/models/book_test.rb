require 'test_helper'

class BookTest < ActiveSupport::TestCase

	def setup
	   @author = Author.create!(authorname: "mashrur" , email: "mashrur@example.com", password: "password", password_confirmation: "password") 
       @book = @author.books.build(name: "Adventure Jack", description: "Adventure Jack is a great adventure book")
    end


    test "book without author should be invalid" do 
        @book.author_id = nil
        assert_not @book.valid?
    end

    test "book should be valid" do
    	assert @book.valid?
    end

    test "name should be present" do
        @book.name = " "
        assert_not @book.valid?
    end
  
    test "description should be present" do
        @book.description = " "
        assert_not @book.valid?
    end

    test "description shouldn't be less than 5 characters" do
    	@book.description = "a" * 3
    	assert_not @book.valid?
    end

    test "description shouldn't be more than 500 characters" do
    	@book.description = "a" * 501
    	assert_not @book.valid?
    end



end