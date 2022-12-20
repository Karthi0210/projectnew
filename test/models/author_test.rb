require 'test_helper'

class AuthorTest < ActiveSupport::TestCase

  def setup
  	@author = Author.new(authorname: "john" , email: "john@example.com")
  end

  test "Should be vaild" do
  	assert @author.valid?
  end

  test "name should be present" do
  	@author.authorname = " "
  	assert_not @author.valid?
  end

  test "name should be less than 30 characters" do
  	@author.authorname = "a" *31
  	assert_not @author.valid?
  end

  test "email should be present" do
  	assert @author.valid?
  end

  test "email should not be too long" do 
  	@author.email = "a" * 245 + "@example.com"
  	assert_not @author.valid?
  end

  test "email should accept correct format" do 
  	vails_emails = %w[user@example.com MASHRUR@gmail.com M.first@yahoo.ca john+smith@co.uk.org]
  	vails_emails.each do |vailds|
  		@author.email = vailds
  		assert @author.valid?, "#{vailds.inspect} should be valid"
  	end
  end

  test "email should reject invalid format" do 
  	invalid_emails = %w[mashrur@example mashrur@example,com mashrur.name@gmail. joe@bar+foo.com]
  	invalid_emails.each do |invalids|
  		@author.email = invalids
        assert_not @author.valid?, "#{invalids.inspect} should be invalid"
    end
  end

  test "email should be unique and case insensitive" do
    duplicate_author = @author.dup
    duplicate_author.email = @author.email.upcase
    @author.save
    assert_not duplicate_author.valid?
  end

  test "email should be lower case before hitting db" do
  mixed_email = "JohN@ExampLe.com"
  @author.email = mixed_email
  @author.save
  assert_equal mixed_email.downcase, @author.reload.email 
end


end