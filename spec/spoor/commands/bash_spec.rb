# frozen_string_literal: true

require "spec_helper"

RSpec.describe Spoor::Commands::Bash do
  let(:cli) { described_class.new }

  describe "#bash" do
    it "starts a Bash shell in the web container" do
      expect(Spoor::Tasks::Docker).to receive(:check_docker)
      expect(cli).to receive(:run_in_container).with("web", "bash")
      cli.bash
    end
  end
end
