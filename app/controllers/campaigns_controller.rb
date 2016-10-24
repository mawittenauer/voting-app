class CampaignsController < ApplicationController
  before_action :require_user
  
  def index
    @campaigns = Campaign.all
  end
  
  def show
    @campaign = Campaign.find(params[:id])
    @side_one = @campaign.sides.first
    @side_two = @campaign.sides.second
  end
  
  def create
    campaign = Campaign.new(title: params[:campaign_title])
    side_one = Side.new(title: params[:side_one_title], campaign: campaign)
    side_two = Side.new(title: params[:side_two_title], campaign: campaign)
    
    flash.now[:danger] = "Both sides and campaign must have a title" unless side_one.valid? && side_two.valid? && campaign.valid?
    
    if campaign.valid? && side_one.valid? && side_two.valid?
      campaign.save
      side_one.save
      side_two.save
      redirect_to campaign
    else
      render :new
    end
  end
end
