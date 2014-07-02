class User < ActiveRecord::Base
  has_many :identities
  has_many :services, through: :identities
  has_and_belongs_to_many :apps

  validates :username, uniqueness: { case_sensitive: false }, allow_nil: true
  validates_format_of :avatar_url, with: URI::regexp(%w(http https)), allow_blank: true
end
