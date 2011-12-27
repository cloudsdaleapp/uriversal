require 'uriversal'

module Uriversal
  module Strategy
    def self.included(base)
      Uriversal.strategies << base
    end
  end
end