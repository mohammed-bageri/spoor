# frozen_string_literal: true

require "spoor/commands/base"

module Spoor
  module Commands
    # Bash command
    class Bash < Base
      desc "bash", "Start a Bash shell in the app container"
      def bash
        Spoor::Tasks::Docker.check_docker
        run_in_container("web", "bash")
      end
    end
  end
end
