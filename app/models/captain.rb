class Captain < ApplicationRecord
  # Associations
  has_one :team, dependent: :destroy

  # Validations
  validates :login, :email, :password, presence: true
  validates :login, :email, uniqueness: true
  validates :login, length: {maximum: 50}
  validates :email,
    length: {maximum: 150}, 
    format: {
      with: %r{
        \A([a-zA-Z0-9\!\#\$\%\&\'\*\+\-\=\?\^\_\`\{\|\}\~\.]+)\@([a-zA-Z0-9\-\_
        \.]+)\.([a-zA-Z0-9]+)\Z
      }xi
    }
  validates :password,
    format: {with: /\A[^\s\\\/]+\Z/i},
    length: {in: 8..72},
    confirmation: true
end
