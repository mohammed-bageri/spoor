# frozen_string_literal: true

require "spec_helper"

RSpec.describe Spoor::Commands::Base do
  let(:cli) { described_class.new }

  describe "#run_in_container" do
    it "runs a command in a Docker container" do
      expect(cli).to receive(:system).with("docker-compose exec web rails server")
      cli.run_in_container("web", "rails", "server")
    end
  end
end
