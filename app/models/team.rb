class Team < ApplicationRecord
  # Associations
  belongs_to :captain
  has_and_belongs_to_many :tournaments

  mount_uploader :logo, LogoUploader

  # Validations
  validates :title, presence: true, uniqueness: true
  validates :logo, image_size: {
    min_height: 200, min_width: 200, 
    max_height: 8000, max_width: 8000
  }
  validates_integrity_of :logo
  validates_processing_of :logo
end
