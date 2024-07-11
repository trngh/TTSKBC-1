class Subject < ApplicationRecord
  has_many :events
  has_many :e_registrations
end
