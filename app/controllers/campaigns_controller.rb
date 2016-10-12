class CampaignsController < ApplicationController
  def create
    campaign = Campaign.create(title: params[:campaign_title])
    Side.create(title: params[:side_one_title], campaign: campaign)
    Side.create(title: params[:side_two_title], campaign: campaign)
    redirect_to campaign
  end
end
