# frozen_string_literal: true

require "spoor/commands/base"

module Spoor
  module Commands
    # Psql command
    class Psql < Base
      desc "psql", "Start a PostgreSQL CLI session"
      def psql
        Spoor::Tasks::Docker.check_docker
        run_in_container("db", "psql", "-U", "rails", "-d", "rails_development")
      end
    end
  end
end
