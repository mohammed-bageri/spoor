# frozen_string_literal: true

# Load the version file
require_relative "lib/spoor/version"

Gem::Specification.new do |spec|
  spec.name          = "spoor"
  spec.version       = Spoor::VERSION
  spec.authors       = ["Mohammed Bageri"]
  spec.email         = ["mohammed.bajiri.00@gmail.com"]

  spec.summary       = "A Docker-based development environment for Rails, inspired by Laravel Sail."
  spec.description   = "Spoor simplifies setting up and managing a Dockerized development environment for Ruby on Rails applications." # rubocop:disable Layout/LineLength
  spec.homepage      = "https://github.com/mohammed-bageri/spoor"
  spec.license       = "MIT"
  spec.required_ruby_version = ">= 3.0.0"

  # Include only the necessary files
  spec.files         = Dir["lib/**/*", "exe/**/*", "templates/**/*", "README.md", "LICENSE.txt", "CHANGELOG.md",
                           "lib/spoor/templates/.env.example"]
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  # Metadata
  spec.metadata["source_code_uri"] = "https://github.com/mohammed-bageri/spoor"
  spec.metadata["changelog_uri"] = "https://github.com/mohammed-bageri/spoor/blob/main/CHANGELOG.md"
  spec.metadata["allowed_push_host"] = "https://rubygems.org" # Replace with your gem server URL

  # Runtime dependencies
  spec.add_dependency "thor", "~> 1.2"

  # Development dependencies
  spec.add_development_dependency "rake", "~> 13.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "rubocop", "~> 1.0"
end
