module ParticipationsCountable
  extend ActiveSupport::Concern

  included do
    scope :with_participations_number, lambda {
      joins(format(
        'LEFT JOIN (
            SELECT %{table_id}, COUNT(id) AS participations_number
            FROM %{participations_table}
            GROUP BY %{table_id}
          ) AS participations
          ON participations.%{table_id} = %{table_name}.id
        ',
        {
          table_id: "#{name.downcase}_id",
          participations_table: Participation.table_name,
          table_name: table_name
        }).gsub(/\s+/, ' ')
      ).select("#{table_name}.*, participations.participations_number")
    }
  end

  def participations_number
    read_attribute(:participations_number) || 0
  end
end
