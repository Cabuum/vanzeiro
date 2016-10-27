class Authorization < ActiveRecord::Base
  belongs_to :user

  after_create :fetch_details

  def fetch_details
    send("fetch_details_from_#{provider.downcase}")
  end

  def fetch_details_from_facebook
    graph = Koala::Facebook::API.new(token)
    facebook_data = graph.get_object('me')
    self.username = facebook_data['username']
    save
  end

  def fetch_details_from_google_oauth2
  end
end
