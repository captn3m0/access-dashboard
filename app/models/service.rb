require 'excon'

class Service < ActiveRecord::Base
  has_many :apps, inverse_of: :service
  has_many :identities
  has_many :users, through: :identities

  validates_format_of :logo_url, with: URI::regexp(%w(http https)), allow_blank: true
  validates :name, uniqueness: { case_sensitive: false }
  validates :name, presence: true

  def configured?
    case name
    when /github/i
      ENV['DASHBOARD_GITHUB_TOKEN'].nil? ? false : true
    when /heroku/i
      ENV['DASHBOARD_HEROKU_API_KEY'].nil? ? false : true
    else
      raise "Unknown service: #{name}"
    end
  end

  def client
    if configured?
      case name
      when /github/i
        Excon.new("https://#{ENV['DASHBOARD_GITHUB_TOKEN']}:x-oauth-basic@api.github.com")
      when /heroku/i
        Excon.new("https://:#{ENV['DASHBOARD_HEROKU_API_KEY']}@api.heroku.com")
      end
    else
      raise "#{name} client not configured."
    end
  end

  def refresh_permissions
    apps.each do |app|
      app.refresh_permissions
    end
  end

end
