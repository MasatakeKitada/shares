class Group < ActiveRecord::Base

  has_attached_file :avatar,
  styles: {medium: "370x250#", thumb: "90x90#"}

  validates_attachment_content_type :avatar,
  content_type: ["image/jpg", "image/jpeg", "image/png"]

  has_many :users_groups
  has_many :users, through: :users_groups
  has_many :pages

end
