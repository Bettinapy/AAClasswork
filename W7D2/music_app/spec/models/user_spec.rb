require 'rails_helper'

describe User do 
  let(:)
  it { should validate_presence_of(:email)}
  it { should validate_presence_of(:password_digest)}
  it { should validate_length_of(:password).is_at_least(6)}

  describe "#is_password?(password)" do 
    it "should accecpt a string as an arg" do 
      expect
  end

end

