class Connection < ActiveRecord::Base

  belongs_to :user
  belongs_to :card
  has_many :connections_groups

end