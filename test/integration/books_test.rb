require 'test_helper'

class BooksTest < ActionDispatch::IntegrationTest


  def setup
    @author = Author.create!(authorname: "mashrur" , email: "mashrur@example.com")
    @book = Book.create(name: "Pale Sky", description: "Life of a depressed young man." , author: @author)
    @book2 = @author.books.build(name: "The Anubis Gates", description: "Brendan Doyle, a specialist in the work of the early-nineteenth century poet William Ashbless, reluctantly accepts an invitation from a millionaire to act as a guide to time-travelling tourists.")
    @book2.save
  end


  test "should get books index" do
    get books_url
    assert_response :success
  end

  test "should get books listing" do
    get books_path
    assert_template 'books/index'
    assert_match @book.name , response.body  
    assert_match @book2.name , response.body
  end


end
