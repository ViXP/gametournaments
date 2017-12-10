class Tournament < ApplicationRecord
  # Associations
  has_and_belongs_to_many :teams

  # Validations
  validates :title, presence: true, length: {maximum: 250}

  def participants_number
    teams.count
  end
end
