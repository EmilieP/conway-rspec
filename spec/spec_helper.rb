require_relative '../lib/cell'
require_relative '../lib/location'
require_relative '../lib/universe'

require_relative 'patterns_helper'

RSpec.configure do |config|
  # Use color in STDOUT
  config.color_enabled = true

  # Use color not only in STDOUT but also in pagers and files
  config.tty = true

  config.include PatternsHelper

  # Use the specified formatter
  config.formatter = :documentation # :progress, :html, :textmate
end
