class Nut < ActiveRecord::Base
  belongs_to :user

  validates :title, :body, :presence => true

  before_save do |nut|
  		nut.title = nut.title.downcase 
  		nut.rating ||= 0
  end
end
