class Service < ActiveRecord::Base
  has_many :apps

  validates :name, :is_dynamic, presence: true
end
