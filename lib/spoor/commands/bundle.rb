# frozen_string_literal: true

require "spoor/commands/base"

module Spoor
  module Commands
    # Bundle command
    class Bundle < Base
      desc "bundle COMMAND", "Run a Bundler command"
      def bundle(*args)
        Spoor::Tasks::Docker.check_docker
        run_in_container("web", "bundle", *args)
      end
    end
  end
end
