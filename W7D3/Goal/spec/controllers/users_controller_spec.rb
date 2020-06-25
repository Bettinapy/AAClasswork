require 'rails_helper'

RSpec.describe UsersController, type: :controller do 
    subject(:user) do 
        User.create!(email: "millie@gmail.com", password: "password")
    end

    # describe "get#index" do 
    #     it "renders the users#index" do 
    #         get :index  
    #         expect(response).to render_template(:index)
    #     end
    # end

    describe "get#show" do 
        it "renders the users#show" do 
            get :show, params: {id: user.id}
            expect(response).to render_template(:show)
        end

        context "if the user does not exist" do 
            it "is not a success" do 
                begin   
                    get :show, params: {id: 100}
                rescue  
                    ActiveRecord::RecordNotFound
                end
                expect(response).not_to render_template(:show)
            end
        end
    end

    describe "get#new" do 
        it "renders form to make a new user" do
            # allow(subject).to receive(:logged_in?).and_turn(true)
            get :new
            expect(response).to render_template(:new)
        end
    end

    describe "delete#destroy" do
        let!(:test_user){create(:user)}
        before :each do
            # allow(subject)
            delete :destroy, params: {id: test_user.id}
        end

        it "destory the user" do
            expect(User.exists?(test_user.id)).to be(false)
        end

        it "redirects to users_url" do
            expect(response).to have_http_status(302)
            expect(response).to redirect_to(users_url)
        end
    end

    describe "POST#create" do
        # before :each  do 
        # end
        let(:valid_params){
           {user: {
                email: 'abc@xyz.com',
                password: 'testing'
            }}
        }
        let(:invalid_params){
           {user: {
                username: '',
                password: 'test'
            }}
        }

        context "with valid_params" do 
            before :each do 
                post :create, params: valid_params
            end
            it "create the user" do
                expect(User.exists?(User.last.id)).to be(true)
            end
            it "redirects to user_url" do  
                expect(response).to redirect_to(user_url(User.last.id))
            end
        end

        context "with invalid_params" do 
            before :each do 
                post :create, params: invalid_params
            end
            it "redirects to new_user_url" do  
                expect(response).to render_template(:new)
            end
            it "add errors to flash" do
                expect(flash[:errors]).to be_present 
            end
        end

    end
    
end 