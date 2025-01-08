# frozen_string_literal: true

require "spoor/commands/base"
require "fileutils"

module Spoor
  module Commands
    # Install command
    class Install < Base
      desc "install", "Install Spoor in the current project"
      option :force_dockerfile, type: :boolean, default: false, desc: "Overwrite the existing Dockerfile"
      def install # rubocop:disable Metrics/AbcSize,Metrics/MethodLength
        Spoor::Tasks::Docker.check_docker

        # Copy docker-compose.yml
        FileUtils.cp(
          File.join(__dir__, "..", "..", "templates", "docker-compose.yml"),
          "docker-compose.yml"
        )

        # Copy Dockerfile only if it doesn't exist or if forced
        dockerfile_path = File.join(Dir.pwd, "Dockerfile")
        if options[:force_dockerfile] || !File.exist?(dockerfile_path)
          ruby_version = Spoor::Utils::Env.detect_ruby_version
          dockerfile_content = ERB.new(File.read(File.join(__dir__, "..", "..", "templates",
                                                           "Dockerfile.erb"))).result(binding)
          File.write(dockerfile_path, dockerfile_content)
        end

        puts "Spoor has been installed! Run `spoor up` to start the environment."
      end
    end
  end
end
