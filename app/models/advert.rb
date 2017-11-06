class Advert < ApplicationRecord
  mount_uploader :image, ImageUploader
  validates :title, :body, presence: true
  has_many :comments

  belongs_to :user
end
