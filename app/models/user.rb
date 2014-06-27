class User < ActiveRecord::Base
  has_many :identities
  has_many :services, through: :identities

  validates :username, presence: true, uniqueness: { case_sensitive: false }
  validates_format_of :avatar_url, with: URI::regexp(%w(http https)), allow_blank: true
end
