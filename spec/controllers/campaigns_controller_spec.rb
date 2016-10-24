require 'spec_helper'
require 'rails_helper'

describe CampaignsController do
  describe "GET index" do
    it "redirects to the sign in page for unauthenticated users" do
      get :index
      expect(response).to redirect_to sign_in_path
    end
  end
  
  describe "POST create" do
    context "with valid input" do
      let(:user) { Fabricate(:user) }
      before do
        session[:user_id] = user.id
        post :create, campaign_title: "Hillary vs. Trump", side_one_title: "Trump", side_two_title: "Hillary"
      end
      
      it "creates a new campaign" do
        expect(Campaign.count).to eq(1)
      end
      it "creates two sides" do
        expect(Side.count).to eq(2)
      end
      it "associates both sides with the campaign" do
        expect(Side.first.campaign).to eq(Campaign.first)
      end
      it "redirects to the campaign show page" do
        expect(response).to redirect_to Campaign.first
      end
    end
    
    context "with invalid input" do
      let(:user) { Fabricate(:user) }
      before do
        session[:user_id] = user.id
        post :create, campaign_title: "", side_one_title: "", side_two_title: ""
      end
      
      it "doesn't create a new campaign" do
        expect(Campaign.count).to eq(0)
      end
      it "doesn't create sides" do
        expect(Side.count).to eq(0)
      end
      it "sets the flash danger message" do
        expect(flash[:danger]).to be_present
      end
      it "renders the new template" do
        expect(response).to render_template :new
      end
    end
  end
end
