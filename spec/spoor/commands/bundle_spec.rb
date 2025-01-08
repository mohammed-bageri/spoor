# frozen_string_literal: true

require "spec_helper"

RSpec.describe Spoor::Commands::Bundle do
  let(:cli) { described_class.new }

  describe "#bundle" do
    it "runs a Bundler command in the web container" do
      expect(Spoor::Tasks::Docker).to receive(:check_docker)
      expect(cli).to receive(:run_in_container).with("web", "bundle", "install")
      cli.bundle("install")
    end
  end
end
