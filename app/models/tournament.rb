class Tournament < ApplicationRecord
  include ParticipationsCountable

  # Associations
  has_many :participations, dependent: :destroy
  has_many :teams, -> { distinct }, through: :participations

  # Validations
  validates :title, presence: true, length: { maximum: 250 }

  # Scopes
  default_scope { with_participations_number.order(created_at: :desc) }
  scope :with_participants, -> { joins(:teams) }

  delegate \
    :'participates?', :participate, :stop_participation, to: :participations
end
