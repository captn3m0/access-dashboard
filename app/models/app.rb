class App < ActiveRecord::Base
  belongs_to :service
  has_and_belongs_to_many :users

  validates :service, :name, presence: true
  validates :name, uniqueness: { scope: :service, case_sensitive: false }

  def sync_users
    client = self.service.client

    case self.service.name

    when /github/i
      response = client.get(:path => "/repos/#{self.name}/teams")
      teams = JSON.parse response.body
      teams.each do |team|
        response = client.get(:path => "/teams/#{team['id']}/members")
        members = JSON.parse response.body
        members.each do |m|
          user = if m['email']
            User.find_or_create_by(heroku_email: m['email']) do |u|
              u.avatar_url = m['avatar_url']
              u.login = m['login']
            end
          else
            User.find_or_create_by(username: m['login']) do |u|
              u.avatar_url = m['avatar_url']
              u.heroku_email = nil
            end
          end

          self.users << user unless users.include?(user)
        end
      end

    when /heroku/i
      response = client.get(:path => "/apps/#{self.name}/collaborators")
      collaborators = JSON.parse response.body
      collaborators.each do |collab|
        user = User.find_or_create_by_heroku_email(collab['email']) do |u|
          u.username = nil
        end
        self.users << user unless users.include?(user)
      end
    end

  end

end
