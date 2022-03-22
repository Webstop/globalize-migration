require "globalize/migration/version"

module Globalize
  module Migration
    require 'globalize/migration/engine' if defined?(Rails)
    class Error < StandardError; end
    # Your code goes here...
  end
end
