# frozen_string_literal: true

require "spec_helper"

RSpec.describe Spoor::Commands::Down do
  let(:cli) { described_class.new }

  describe "#down" do
    it "stops the Spoor environment" do
      expect(Spoor::Tasks::Docker).to receive(:check_docker)
      expect(cli).to receive(:system).with("docker-compose down")
      capture_stdout { cli.down }
    end
  end
end
