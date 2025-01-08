# frozen_string_literal: true

require "thor"
require "dotenv"

module Spoor
  # Main CLI that run the command
  class CLI < Thor
    include Thor::Actions

    def initialize(*args)
      super
      Dotenv.load(".env") # Load .env file
    end

    desc "install", "Install Spoor in the current project"
    option :force_dockerfile, type: :boolean, default: false, desc: "Overwrite the existing Dockerfile"
    def install
      Spoor.install(force_dockerfile: options[:force_dockerfile])
    end

    desc "up", "Start the Spoor environment"
    def up
      Spoor.check_docker
      say "Starting Spoor..."
      system("docker-compose up -d")
    end

    desc "down", "Stop the Spoor environment"
    def down
      Spoor.check_docker
      say "Stopping Spoor..."
      system("docker-compose down")
    end

    desc "rails COMMAND", "Run a Rails command"
    def rails(*args)
      Spoor.check_docker
      run_in_container("web", "rails", *args)
    end

    desc "bundle COMMAND", "Run a Bundler command"
    def bundle(*args)
      Spoor.check_docker
      run_in_container("web", "bundle", *args)
    end

    desc "rake COMMAND", "Run a Rake command"
    def rake(*args)
      Spoor.check_docker
      run_in_container("web", "rake", *args)
    end

    desc "psql", "Start a PostgreSQL CLI session"
    def psql
      Spoor.check_docker
      run_in_container("db", "psql", "-U", "rails", "-d", "rails_development")
    end

    desc "redis", "Start a Redis CLI session"
    def redis
      Spoor.check_docker
      run_in_container("redis", "redis-cli")
    end

    desc "bash", "Start a Bash shell in the app container"
    def bash
      Spoor.check_docker
      run_in_container("web", "bash")
    end

    private

    def run_in_container(service, *command)
      system("docker-compose exec #{service} #{command.join(" ")}")
    end
  end
end
