class CommentsController < ApplicationController
  before_action :require_user
  
  def create
    @campaign = Campaign.find(params[:campaign_id])
    @side_one = @campaign.sides.first
    @side_two = @campaign.sides.second
    @comments = @campaign.comments
    comment = Comment.new(content: params[:content])
    comment.campaign_id = @campaign.id
    comment.user_id = current_user.id
    
    if comment.save
      redirect_to @campaign
    else
      flash.now[:danger] = "You cannot leave a blank comment."
      render 'campaigns/show'
    end
  end
end
