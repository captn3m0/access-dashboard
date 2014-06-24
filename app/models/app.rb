class App < ActiveRecord::Base
  belongs_to :service

  validates :service, :name, presence: true
end
