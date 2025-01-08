# frozen_string_literal: true

require "spoor/commands/base"

module Spoor
  module Commands
    # Down command
    class Down < Base
      desc "down", "Stop the Spoor environment"
      def down
        Spoor::Tasks::Docker.check_docker
        say "Stopping Spoor..."
        system("docker-compose down")
      end
    end
  end
end
