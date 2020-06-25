require 'spec_helper'
require 'rails_helper'

feature 'the signup process' do
  scenario 'has a new user page' do 
    visit new_user_url
    expect(page).to have_content("Email")
    expect(page).to have_content("Password")
  end

  feature 'signing up a user' do
    scenario 'shows username on the homepage after signup' do
        visit new_user_url
        fill_in("email", with: "andy@gmail.com")
        fill_in("password", with: "password")
        save_and_open_page
        click_on("Sign up")
        expect(current_path).to eq("users")
        expect(page).to have_content("andy@gmail.com")

    end
  end
end

# feature 'logging in' do
#   scenario 'shows username on the homepage after login'

# end

# feature 'logging out' do
#   scenario 'begins with a logged out state'

#   scenario 'doesn\'t show username on the homepage after logout'

# end