# frozen_string_literal: true

require "spec_helper"

RSpec.describe Spoor::Tasks::Docker do
  describe ".docker_installed?" do
    it "returns true if Docker is installed" do
      allow(described_class).to receive(:system).with("docker --version > /dev/null 2>&1").and_return(true)
      expect(described_class.docker_installed?).to be true
    end

    it "returns false if Docker is not installed" do
      allow(described_class).to receive(:system).with("docker --version > /dev/null 2>&1").and_return(false)
      expect(described_class.docker_installed?).to be false
    end
  end

  describe ".docker_running?" do
    it "returns true if Docker is running" do
      allow(described_class).to receive(:system).with("docker info > /dev/null 2>&1").and_return(true)
      expect(described_class.docker_running?).to be true
    end

    it "returns false if Docker is not running" do
      allow(described_class).to receive(:system).with("docker info > /dev/null 2>&1").and_return(false)
      expect(described_class.docker_running?).to be false
    end
  end
end
