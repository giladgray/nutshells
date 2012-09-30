class Nut < ActiveRecord::Base
  belongs_to :user

  validates :title, :body, :presence => true

  before_save { |nut| nut.title = nut.title.downcase }
end
