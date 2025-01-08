# frozen_string_literal: true

require "spoor/version"
require "spoor/cli"
require "fileutils"

# Spoor ClI
module Spoor
  def self.docker_installed?
    # Check if Docker is installed
    system("docker --version > /dev/null 2>&1")
  end

  def self.docker_running?
    # Check if Docker is running
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

  def self.detect_ruby_version
    # Check for .ruby-version file
    return File.read(".ruby-version").strip if File.exist?(".ruby-version")

    # Check for Ruby version in Gemfile
    if File.exist?("Gemfile")
      gemfile_content = File.read("Gemfile")
      if match = gemfile_content.match(/ruby ['"]([^'"]+)['"]/)
        return match[1]
      end
    end

    # Default to a supported Ruby version
    "3.2.0"
  end

  def self.install(force_dockerfile: false) # rubocop:disable Metrics/AbcSize,Metrics/MethodLength
    check_docker

    # Copy docker-compose.yml
    FileUtils.cp(
      File.join(__dir__, "spoor", "templates", "docker-compose.yml"),
      "docker-compose.yml"
    )

    # Copy .env
    FileUtils.cp(
      File.join(__dir__, "spoor", "templates", ".env.example"),
      ".env"
    )

    # Copy Dockerfile only if it doesn't exist or if forced
    dockerfile_path = File.join(Dir.pwd, "Dockerfile")
    if force_dockerfile || !File.exist?(dockerfile_path)
      ruby_version = detect_ruby_version
      dockerfile_content = ERB.new(File.read(File.join(__dir__, "spoor", "templates",
                                                       "Dockerfile.erb"))).result(binding)
      File.write(dockerfile_path, dockerfile_content)
    end

    puts "Spoor has been installed! Run `spoor up` to start the environment."
  end
end
