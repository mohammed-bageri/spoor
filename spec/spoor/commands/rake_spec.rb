# frozen_string_literal: true

require "spec_helper"

RSpec.describe Spoor::Commands::Rake do
  let(:cli) { described_class.new }

  describe "#rake" do
    it "runs a Rake command in the web container" do
      expect(Spoor::Tasks::Docker).to receive(:check_docker)
      expect(cli).to receive(:run_in_container).with("web", "rake", "db:migrate")
      cli.rake("db:migrate")
    end
  end
end
