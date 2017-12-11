class Captain < ApplicationRecord
  # Associations
  has_one :team, dependent: :destroy

  # Validations
  validates :login, :email, uniqueness: true
  validates :login, length: { maximum: 50 }, presence: true
  validates :email, allow_blank: true, length: { maximum: 150 },
    format: {
      with: /
        \A([a-zA-Z0-9\!\#\$\%\&\'\*\+\-\=\?\^\_\`\{\|\}\~\.]+)\@([a-zA-Z0-9\-\_
        \.]+)\.([a-zA-Z0-9]+)\Z
      /xi
    }
end
