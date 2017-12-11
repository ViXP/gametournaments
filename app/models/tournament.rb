class Tournament < ApplicationRecord
  # Associations
  has_many :participations, dependent: :destroy
  has_many :teams, -> { distinct }, through: :participations

  # Validations
  validates :title, presence: true, length: { maximum: 250 }

  # Scopes
  scope :with_participants, -> { joins(:participations).joins(:teams) }

  delegate \
    :'participates?', :participate, :participants_number, :stop_participation,
    to: :participations
end
