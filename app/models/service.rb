class Service < ActiveRecord::Base
  has_many :apps, inverse_of: :service

  validates :name, uniqueness: { case_sensitive: false }
  validates :name, presence: true
end
