module ParticipationsCountable
  extend ActiveSupport::Concern

  included do
    scope :with_participations_number, lambda { joins(:participations)
      .select("#{table_name}.*", 'count(*) AS participations_number')
      .group("#{table_name}.id") }
  end

  def participations_number
    read_attribute(:participations_number)
  end
end
