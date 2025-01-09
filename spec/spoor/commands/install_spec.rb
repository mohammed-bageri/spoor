# frozen_string_literal: true

require "spec_helper"

RSpec.describe Spoor::Commands::Install do
  let(:cli) { described_class.new }

  describe "#install" do
    let(:temp_dir) { Dir.mktmpdir }

    before do
      allow(Spoor::Tasks::Docker).to receive(:check_docker)
      allow(Spoor::Utils::Env).to receive(:detect_ruby_version).and_return("3.2.0")
      Dir.chdir(temp_dir)
    end

    after do
      FileUtils.remove_entry(temp_dir)
    end

    it "copies the docker-compose.yml file" do
      cli.install
      expect(File.exist?("docker-compose.yml")).to be true
    end

    it "creates a Dockerfile if it doesn't exist" do
      cli.install
      expect(File.exist?("Dockerfile")).to be true
    end

    it "overwrites the Dockerfile if forced" do
      File.write("Dockerfile", "old content")
      cli.install(force_dockerfile: true)
      expect(File.read("Dockerfile")).not_to eq("old content")
    end
  end
end
