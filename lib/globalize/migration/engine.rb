require 'rails'
module Globalize
  module Migration
    class Engine < Rails::Engine

      config.app_generators do |g|
        g.templates.unshift File::expand_path('../../../templates', __FILE__)
      end

    end
  end
end

