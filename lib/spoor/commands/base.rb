# frozen_string_literal: true

require "thor"

module Spoor
  module Commands
    # Base class for CLI
    class Base < Thor
      include Thor::Actions

      def initialize(*args)
        super
      end

      no_commands do
        def run_in_container(service, *command)
          system("docker-compose exec #{service} #{command.join(" ")}")
        end
      end
    end
  end
end
