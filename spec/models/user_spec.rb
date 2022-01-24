require 'rails_helper'

RSpec.describe User, type: :model do
#   pending "add some examples to (or delete) #{__FILE__}"
# end

before do
  @user = User.new(
    first_name: "Example User", 
    last_name: "Example User1", 
    email: "user@example.com",
    password: "foobar123", 
    password_confirmation: "foobar123"
  )
end

# describe User do

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


    

   

    # describe User, 'validations' do
      # it { should @user.validate_uniqueness_of(:email) }
      # it { should @user.validate_presence_of(:email) }
      # it { should @user.validate_format_of(:email).with_message(VALID_EMAIL_REGEX) }
    # end




    # it { should validate_uniqueness_of(:email) }
    # it { should validate_presence_of(:email) }
    # it { should validate_format_of(:email).with_message(VALID_EMAIL_REGEX) }





end