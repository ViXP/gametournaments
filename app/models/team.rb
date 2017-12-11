class Team < ApplicationRecord
  # Associations
  belongs_to :captain
  has_many :participations, dependent: :destroy
  has_many :tournaments, -> { distinct }, through: :participations

  mount_uploader :logo, LogoUploader

  # Validations
  validates :title, presence: true, uniqueness: true
  validates_integrity_of :logo
  validates_processing_of :logo
  validates :logo, allow_blank: true, image_size: {
    min_height: 200, min_width: 200, 
    max_height: 8000, max_width: 8000
  }

  delegate :participants_number, to: :participations
end
