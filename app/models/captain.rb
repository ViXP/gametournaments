class Captain < ApplicationRecord
  # Associations
  has_one :team, dependent: :destroy

  # Validations
  validates :login, :email, uniqueness: true, presence: true
  validates :login, length: {maximum: 50}
  validates :email,
    length: {maximum: 150}, 
    format: {
      with: %r{
        \A([a-zA-Z0-9\!\#\$\%\&\'\*\+\-\=\?\^\_\`\{\|\}\~\.]+)\@([a-zA-Z0-9\-\_
        \.]+)\.([a-zA-Z0-9]+)\Z
      }xi
    }
end
