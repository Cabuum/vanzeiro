class Newsletter < ActiveRecord::Base
  validates :mail, presence: { validate: /\A([\w\.%\+\-]+)@([\w\-]+\.)+([\w]{2,})\z/i }
end
