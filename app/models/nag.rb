class Nag < ActiveRecord::Base  
  attr_accessible :content

  belongs_to :member

  validates :content, :presence => true, :length => { :maximum => 140 }
  validates :member_id, :presence => true

  default_scope :order => 'nags.created_at DESC'
end
