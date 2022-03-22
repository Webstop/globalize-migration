lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'globalize/migration/version'

Gem::Specification.new do |spec|
  spec.name          = "globalize-migration"
  spec.version       = Globalize::Migration::VERSION
  spec.authors       = ["Greg Hemphill"]
  spec.email         = ["greg@webstop.com"]

  spec.summary       = "Opinionated migrations for Globalize gem support."
  spec.homepage      = "https://github.com/Webstop/gobalize-migration"
  spec.license       = "MIT"
  spec.required_ruby_version = Gem::Requirement.new(">= 2.5.0")

  #spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"

  spec.metadata["homepage_uri"]    = spec.homepage
  spec.metadata["source_code_uri"] = spec.homepage
  spec.metadata["changelog_uri"]   = "#{spec.homepage}/releases"
    
  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  # Dependencies
#   spec.add_dependency "activesupport", "~> 6.0.0"
#   spec.add_dependency "thor", "~> 1.0.1"
#   spec.add_dependency "railties", '~> 6.0.0'
  
  # Development Dependencies 
  spec.add_development_dependency "bundler", "~> 2.1.4"
  spec.add_development_dependency "rake", "~> 13.0.1"
  spec.add_development_dependency "rspec", "~> 3.10"
  spec.add_development_dependency "rspec-rails", "~> 4.0.2"
end
