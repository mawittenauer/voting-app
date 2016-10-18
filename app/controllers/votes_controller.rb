class VotesController < ApplicationController
  before_action :require_user
  
  def create
    campaign = Campaign.find(params[:campaign_id])
    side = Side.find(params[:side_id])
    if current_user.can_vote?(campaign)
      Vote.create(side: side, user: current_user, campaign: campaign) 
    else
      flash[:danger] = "You already voted in this campaign."
    end
    redirect_to campaign
  end
end
