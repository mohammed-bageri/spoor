# frozen_string_literal: true

require "spoor/commands/base"

module Spoor
  module Commands
    # Rake command
    class Rake < Base
      desc "rake COMMAND", "Run a Rake command"
      def rake(*args)
        Spoor::Tasks::Docker.check_docker
        run_in_container("web", "rake", *args)
      end
    end
  end
end
