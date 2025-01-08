# frozen_string_literal: true

module Spoor
  module Tasks
    # Docker tasks
    module Docker
      def self.docker_installed?
        system("docker --version > /dev/null 2>&1")
      end

      def self.docker_running?
        system("docker info > /dev/null 2>&1")
      end

      def self.check_docker
        unless docker_installed?
          puts "Docker is not installed. Please install Docker and try again."
          exit 1
        end

        return if docker_running?

        puts "Docker is not running. Please start Docker and try again."
        exit 1
      end
    end
  end
end
