require 'spec_helper'
require 'rails_helper'

describe VotesController do
  describe "POST create" do
    it "redirects to sign in page for unauthenticated users" do
      post :create, side_id: 1, campaign_id: 1
      expect(response).to redirect_to sign_in_path
    end
  end
end
