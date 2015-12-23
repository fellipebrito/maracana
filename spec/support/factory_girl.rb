RSpec.configure do |config|
  config.include FactoryGirl::Syntax::Methods
end

Dir["#{SPEC_PATH}/factories/*.rb"].each { |file| require file }
