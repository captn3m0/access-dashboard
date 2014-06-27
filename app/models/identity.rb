class Identity < ActiveRecord::Base
  belongs_to :service
  belongs_to :user

  validates :uid, :service, :user, presence: true
  validates :uid, uniqueness: { scope: :service, case_sensitive: false }
end
