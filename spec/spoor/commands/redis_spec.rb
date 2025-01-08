# frozen_string_literal: true

require "spec_helper"

RSpec.describe Spoor::Commands::Redis do
  let(:cli) { described_class.new }

  describe "#redis" do
    it "starts a Redis CLI session" do
      expect(Spoor::Tasks::Docker).to receive(:check_docker)
      expect(cli).to receive(:run_in_container).with("redis", "redis-cli")
      cli.redis
    end
  end
end
