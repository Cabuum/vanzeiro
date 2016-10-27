require File.expand_path('spec/support/forgery_frozen_kinds.rb')

puts 'loading factories...'
Dir[::File.expand_path('../spec/support/factories/*.rb', __FILE__)].each do |f|
  require f
end

include FactoryGirl::Syntax::Methods

# alias RepenseCore to R,
# so you can use R::Product instead of RepenseCore::Product
R = RepenseCore
