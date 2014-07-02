class App < ActiveRecord::Base
  belongs_to :service
  has_and_belongs_to_many :users

  validates :service, :name, presence: true
  validates :name, uniqueness: { scope: :service, case_sensitive: false }
end
