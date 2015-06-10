class Question < ActiveRecord::Base
  has_many :answers, dependent: :destroy
  has_many :votes, :as => :rating
end
