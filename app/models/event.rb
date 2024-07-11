class Event < ApplicationRecord
  belongs_to :subject
  belongs_to :user
  has_many :reviews
  has_many :users, through: :reviews
  has_many :e_joins
  has_many :users, through: :e_joins #event co nhieu user tham gia thong qua join
  belongs_to :room
  mount_uploader :image, ImageUploader

  def update_status_if_expired
    current_time = Time.now
    if current_time >= self.timestart && current_time <= self.timeend
      self.update(status: 1)  # Event is happening, status = 1
    elsif current_time > self.timeend
      self.update(status: 2)  # Event has ended, status = 2
    end
  end
end
