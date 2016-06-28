class Match < ActiveRecord::Base
  belongs_to :user, :foreign_key => 'user_id', :class_name => 'User'
  belongs_to :opponent, :foreign_key => 'opponent_id', :class_name => 'User'
end
