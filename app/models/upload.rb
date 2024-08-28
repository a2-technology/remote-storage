class Upload < ApplicationRecord
  validates :comment, presence: true
end
