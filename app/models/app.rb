class App < ActiveRecord::Base
  belongs_to :service

  validates :service, :name, presence: true
  validates :name, uniqueness: { scope: :service, case_sensitive: false }
end
