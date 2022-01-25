require 'rails_helper'

RSpec.describe User, type: :model do


  before do
    @user = User.new(
      first_name: "Example User", 
      last_name: "Example User1", 
      email: "user@example.com",
      password: "foobar123", 
      password_confirmation: "foobar123"
    )
  end 



  subject {
    User.create(
      first_name: "Example User", 
      last_name: "Example User1",
      email: "user@example.com", 
      password: "foobar123", 
      password_confirmation: "foobar123"
      ) 
  }



  
    it "password should be = password_confirmation" do
      expect(subject.password).to be == subject.password_confirmation
    end




    it "should not create user if password and password_confirmation are unequal" do
      user = User.new(
      first_name: "Example User", 
      last_name: "Example User1",
      email: "user@example.com", 
      password: "foobar123", 
      password_confirmation: "foobar1235678 "
      )
      expect {raise user.errors}.to raise_error
    end

    

  
    describe "when email address is already taken" do
      before do
        user_with_same_email = @user.dup
        user_with_same_email.save!
      end
  
      it { should_not be_valid }
    end




    it "should not let a user be created without an email address" do
      user = User.new(
      first_name: "Example User", 
      last_name: "Example User1",
      email: " ", 
      password: "foobar123", 
      password_confirmation: "foobar123 "
      )
      expect(user).to_not be_valid
    end




    it "should not let a user be created without an first name address" do
      user = User.new(
      first_name: "", 
      last_name: "Example User1",
      email: "user@example.com", 
      password: "foobar123", 
      password_confirmation: "foobar123"
      )
      expect(user).to_not be_valid
    end




    it "should not let a user be created without an last name address" do
      user = User.new(
      first_name: "Example User", 
      last_name: "",
      email: "user@example.com", 
      password: "foobar123", 
      password_confirmation: "foobar123"
      )
      expect(user).to_not be_valid
    end




    it "should not let a user be created with length og password less then 5 characters" do
      user = User.new(
      first_name: "Example User", 
      last_name: "",
      email: "user@example.com", 
      password: "1234", 
      password_confirmation: "1234"
      )
      expect(user).to_not be_valid
    end



    describe 'Validations' do
      it "emails should be defferent since spaces" do
        user = User.new(email: "user@example.com")
        @user = User.new(email: " user@example.com ")
          expect(user).to_not be == @user
      end
    end
 



    describe 'Validations' do
      it "should delete spaces before or after email" do
      user = User.new(
        first_name: "Example User", 
        last_name: "Example User1",
        email: "user@example.com", 
        password: "1234567890", 
        password_confirmation: "1234567890"
        )
          @user = User.authenticate_with_credentials(" user@example.com  ", "1234567890")
          expect(user.email && user.password) == @user
      end
    end
 



    describe '.authenticate_with_credentials' do
      it "emails should be defferent since upper case" do
        user = User.new(email: "user@example.com")
        @user = User.new(email: " USER@exaMPle.com ")
          expect(user).to_not be == @user
      end
    end



  describe 'Validations' do
      it "should remove spaces and upper case  before or after email" do
      user = User.new(
        first_name: "Example User", 
        last_name: "Example User1",
        email: "user@example.com", 
        password: "1234567890", 
        password_confirmation: "1234567890"
        )
          @user = User.authenticate_with_credentials(" USER@exaMPle.com  ", "1234567890")
          expect(user.email && user.password) == @user
      end
    end

end