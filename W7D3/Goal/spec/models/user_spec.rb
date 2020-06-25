require 'rails_helper'

RSpec.describe User, type: :model do
  #pending "add some examples to (or delete) #{__FILE__}"
  describe User do 
    subject(:user) do 
      FactoryBot.build(:user, email: "yuan@gmail.com", password: "password")
    end

    it { should validate_presence_of(:email) }
    it { should validate_presence_of(:password_digest) }
    # it { should validate_presence_of(:session_token) }
    it { should validate_length_of(:password).is_at_least(6) }

    it "creates a session token before validation" do
      user.ensure_session_token
      expect(user.session_token).to_not be_nil
    end

    it "create a password digest when a password is given" do
      expect(user.password_digest).to_not be_nil
    end


    describe "#is_password?" do 
      it "verifies the password is correct" do 
        expect(user.is_password?("password")).to be(true)
      end

      it "verifies the password is not correct" do 
        expect(user.is_password?("incorrect")).to be(false)
      end

    end

    describe ".find_by_credentials" do 
      before {user.save!}
      it "returns user given good credentials" do 
        expect(User.find_by_credentials("yuan@gmail.com", "password")).to eq(user)
      end

      it "returns user given bad credentials" do 
        expect(User.find_by_credentials("random@gmail.com", "word")).to eq(nil)
      end

    end

    describe "#reset_session_token!" do 
      it "sets a new session token" do 
        session_token = user.session_token  
        user.reset_session_token!
        expect(user.session_token).to_not eq(session_token)
      end

      it "returns a new session token" do 
        expect(user.reset_session_token!).to eq(user.session_token)
      end
    end
  end
end
