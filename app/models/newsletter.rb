class Newsletter < ActiveRecord::Base
  validates_presence_of :mail, :validate => /\A([\w\.%\+\-]+)@([\w\-]+\.)+([\w]{2,})\z/i

end
