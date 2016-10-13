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
    
    context "with invalid credentials"
  end
end
