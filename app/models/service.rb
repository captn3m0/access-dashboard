class Service < ActiveRecord::Base
  has_many :apps, inverse_of: :service

  validates_format_of :logo_url, with: URI::regexp(%w(http https))
  validates :name, uniqueness: { case_sensitive: false }
  validates :name, presence: true
end
