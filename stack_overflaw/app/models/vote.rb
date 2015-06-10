class Vote < ActiveRecord::Base
  belongs_to :rating, :polymorphic => true
end
