# frozen_string_literal: true

require "spec_helper"

RSpec.describe Spoor::Commands::Rails do
  let(:cli) { described_class.new }

  describe "#rails" do
    it "runs a Rails command in the web container" do
      expect(Spoor::Tasks::Docker).to receive(:check_docker)
      expect(cli).to receive(:run_in_container).with("web", "rails", "server")
      cli.rails("server")
    end
  end
end
