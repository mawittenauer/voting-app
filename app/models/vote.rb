class Vote < ActiveRecord::Base
  belongs_to :side
  belongs_to :user
  belongs_to :campaign, counter_cache: true
end
