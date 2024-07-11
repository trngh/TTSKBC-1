class ERegistration < ApplicationRecord
  belongs_to :subject
  belongs_to :user
  mount_uploader :image, ImageUploader
end
