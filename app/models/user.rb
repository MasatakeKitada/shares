class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  require 'aws-sdk'
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable

  has_many :users_groups
  has_many :groups, through: :users_groups
  has_many :pages, through: :users_pages
  has_attached_file :avatar,
  styles: {medium: "300x300#", profile: "150x150#", thumb: "100x100#", small: "30x30#"},
  :storage => :s3,
  :s3_credentials => File.join(Rails.root, 'config', 's3.yml'),
  :path => ":attachment/:id/:style.:extension"

  validates_attachment_content_type :avatar,
  content_type: ["image/jpeg", "image/jpg", "image/png"]

  #Facebook Setting


  def self.find_for_oauth(auth)
    user = User.where(uid: auth.uid, provider: auth.provider).first

    fb_image_tag = auth.info.image #facebookから取る画像情報を一旦変数で定義

    unless user
      user = User.create(
        uid:      auth.uid,
        provider: auth.provider,
        nickname: auth.info.name,
        fb_image:   fb_image_tag + "?type=large", #画像URLに文字列を加えることで、サイズの大きい画像を取得
        email:    User.dummy_email(auth),
        password: Devise.friendly_token[0, 20]
      )
    end

    user
  end

  private

  def self.dummy_email(auth)
    "#{auth.uid}-#{auth.provider}@example.com"
  end

end
