class CampaignsController < ApplicationController
  def create
    Campaign.create(title: params[:campaign_title])
    redirect_to root_path
  end
end
