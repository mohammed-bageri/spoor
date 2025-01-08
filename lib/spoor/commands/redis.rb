# frozen_string_literal: true

require "spoor/commands/base"

module Spoor
  module Commands
    # Redis command
    class Redis < Base
      desc "redis", "Start a Redis CLI session"
      def redis
        Spoor::Tasks::Docker.check_docker
        run_in_container("redis", "redis-cli")
      end
    end
  end
end
