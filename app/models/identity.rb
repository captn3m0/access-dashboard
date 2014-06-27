class Identity < ActiveRecord::Base
  belongs_to :service

  validates :uid, :service, presence: true
  validates :uid, uniqueness: { scope: :service, case_sensitive: false }
end
