# frozen_string_literal: true

require "spoor/commands/base"

module Spoor
  module Commands
    # Rails command
    class Rails < Base
      desc "rails COMMAND", "Run a Rails command"
      def rails(*args)
        Spoor::Tasks::Docker.check_docker
        run_in_container("web", "rails", *args)
      end
    end
  end
end
