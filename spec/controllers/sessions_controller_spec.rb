require 'rails_helper'
require'spec_helper'

describe SessionsController do
  describe "POST create" do
    context "with valid credentials" do
      let(:user) { Fabricate(:user) }  
      before { post :create, email: user.email, password: user.password }
      it "adds a user to the session" do
        expect(session[:user_id]).to eq(user.id)
      end
      it "sets the flash success message" do
        expect(flash[:success]).to be_present
      end
      it "redirects to the new campaigns path" do
        expect(response).to redirect_to new_campaign_path
      end
    end
    
    context "with invalid credentials" do
      before { post :create, email: "mike@me.com", password: "pass" }
      it "renders the new template" do
        expect(response).to render_template :new
      end
      it "doesn't add a user to the session" do
        expect(session[:user_id]).to_not be_present
      end
      it "sets the flash danger method" do
        expect(flash[:danger]).to be_present
      end
    end
  end
  
  describe "GET destroy" do
    context "with unauthenticated user" do
      it "redirects to the sign in page" do
        get :destroy
        expect(response).to redirect_to sign_in_path
      end
    end
    context "with authenticated user" do
      before do 
        session[:user_id] = Fabricate(:user).id
        get :destroy
      end
      it "redirects to the sign in page" do
        expect(response).to redirect_to sign_in_path
      end
      it "sets the flash success message" do
        expect(flash[:success]).to be_present
      end
      it "removes the user from the session" do
        expect(session[:user_id]).to_not be_present
      end
    end
  end
end
