class Page < ActiveRecord::Base
  belongs_to :group
  belongs_to :user

  # validates :url, :url => true

  # def valid_url?
  # 	self.valid?(:url)
  # end


end
