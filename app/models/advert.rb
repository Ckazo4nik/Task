class Advert < ApplicationRecord
  mount_uploader :image, ImageUploader
  validates :title, :summary,:body, presence: true
  validates :summary,length: { maximum: 160, too_long: "%{count} Максимальна кількість симолівas"}

  has_many :comments

  belongs_to :user
end
