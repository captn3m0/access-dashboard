class Service < ActiveRecord::Base
  has_many :apps, inverse_of: :service
  has_many :identities

  validates_format_of :logo_url, with: URI::regexp(%w(http https)), allow_blank: true
  validates :name, uniqueness: { case_sensitive: false }
  validates :name, presence: true
end
