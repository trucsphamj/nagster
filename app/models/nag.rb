class Nag < ActiveRecord::Base  
  attr_accessible :content, :receiver_id, :member_id      

  belongs_to :member

  validates :content, :presence => true, :length => { :maximum => 140 }
  validates :member_id, :presence => true
  validate :receiver_id, :presence => true

  default_scope :order => 'nags.created_at DESC'
end
 



