# frozen_string_literal: true

require "spoor/commands/base"

module Spoor
  module Commands
    # Up command
    class Up < Base
      desc "up", "Start the Spoor environment"
      def up(*args)
        Spoor::Tasks::Docker.check_docker
        say "Starting Spoor..."
        system("docker-compose up #{args.join(" ")}")
      end
    end
  end
end
