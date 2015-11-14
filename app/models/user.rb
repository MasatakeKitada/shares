class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :users_groups
  has_many :groups, through: :users_groups

  has_attached_file :avatar,
  styles: {medium: "300x300#", thumb: "100x100#"}

  validates_attachment_content_type :avatar,
  content_type: ["image/jpeg", "image/jpg", "image/png"]

end
