require_relative 'patterns/beacon'
require_relative 'patterns/beehive'
require_relative 'patterns/blinker'
require_relative 'patterns/block'
require_relative 'patterns/boat'
require_relative 'patterns/loaf'
require_relative 'patterns/toad'

module PatternsHelper

  def universe(name)
    send("#{name}_universe")
  end

  def init(name)
    send("#{name}_init")
  end

  def result(name)
    send("#{name}_result")
  end
end
