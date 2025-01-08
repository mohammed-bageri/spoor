# frozen_string_literal: true

require "spoor/commands/base"
require "spoor/commands/install"
require "spoor/commands/up"
require "spoor/commands/down"
require "spoor/commands/rails"
require "spoor/commands/bundle"
require "spoor/commands/rake"
require "spoor/commands/psql"
require "spoor/commands/redis"
require "spoor/commands/bash"

module Spoor
  # Spoor CLI
  class CLI < Thor
    register(Spoor::Commands::Install, "install", "install", "Install Spoor in the current project")
    register(Spoor::Commands::Up, "up", "up", "Start the Spoor environment")
    register(Spoor::Commands::Down, "down", "down", "Stop the Spoor environment")
    register(Spoor::Commands::Rails, "rails", "rails COMMAND", "Run a Rails command")
    register(Spoor::Commands::Bundle, "bundle", "bundle COMMAND", "Run a Bundler command")
    register(Spoor::Commands::Rake, "rake", "rake COMMAND", "Run a Rake command")
    register(Spoor::Commands::Psql, "psql", "psql", "Start a PostgreSQL CLI session")
    register(Spoor::Commands::Redis, "redis", "redis", "Start a Redis CLI session")
    register(Spoor::Commands::Bash, "bash", "bash", "Start a Bash shell in the app container")
  end
end
