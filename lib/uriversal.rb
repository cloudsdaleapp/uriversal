module Uriversal
  
  module Strategies
    autoload :Fallback, 'uriversal/strategies/fallback'
  end
  
  autoload :Strategy, 'uriversal/strategy'
  
  def self.strategies
    @@strategies ||= []
  end
  
end