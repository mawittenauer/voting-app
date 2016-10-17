class VotesController < ApplicationController
  before_action :require_user
  
  def create
    campaign = Campaign.find(params[:campaign_id])
    redirect_to campaign
  end
end
