class Service < ActiveRecord::Base
  has_many :apps, inverse_of: :service

  validates :name, :is_dynamic, presence: true
end
