# frozen_string_literal: true

require "spec_helper"

RSpec.describe Spoor::Commands::Up do
  let(:cli) { described_class.new }

  describe "#up" do
    it "starts the Spoor environment" do
      expect(Spoor::Tasks::Docker).to receive(:check_docker)
      expect(cli).to receive(:system).with("docker-compose up -d")
      capture_stdout { cli.up }
    end
  end
end
