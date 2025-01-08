# frozen_string_literal: true

require "spec_helper"

RSpec.describe Spoor::Commands::Psql do
  let(:cli) { described_class.new }

  describe "#psql" do
    it "starts a PostgreSQL CLI session" do
      expect(Spoor::Tasks::Docker).to receive(:check_docker)
      expect(cli).to receive(:run_in_container).with("db", "psql", "-U", "rails", "-d", "rails_development")
      cli.psql
    end
  end
end
