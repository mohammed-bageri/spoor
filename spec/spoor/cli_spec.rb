# frozen_string_literal: true

require "spoor/cli"

RSpec.describe Spoor::CLI do # rubocop:disable Metrics/BlockLength
  let(:cli) { described_class.new }

  describe "#up" do
    it "starts the Spoor environment" do
      expect(cli).to receive(:system).with("docker-compose up -d")
      cli.up
    end
  end

  describe "#down" do
    it "stops the Spoor environment" do
      expect(cli).to receive(:system).with("docker-compose down")
      cli.down
    end
  end

  describe "#rails" do
    it "runs a Rails command in the web container" do
      expect(cli).to receive(:system).with("docker-compose exec web rails db:migrate")
      cli.rails("db:migrate")
    end
  end

  describe "#bundle" do
    it "runs a Bundler command in the web container" do
      expect(cli).to receive(:system).with("docker-compose exec web bundle install")
      cli.bundle("install")
    end
  end

  describe "#rake" do
    it "runs a Rake command in the web container" do
      expect(cli).to receive(:system).with("docker-compose exec web rake db:seed")
      cli.rake("db:seed")
    end
  end

  describe "#psql" do
    it "starts a PostgreSQL CLI session" do
      expect(cli).to receive(:system).with("docker-compose exec db psql -U rails -d rails_development")
      cli.psql
    end
  end

  describe "#redis" do
    it "starts a Redis CLI session" do
      expect(cli).to receive(:system).with("docker-compose exec redis redis-cli")
      cli.redis
    end
  end

  describe "#bash" do
    it "starts a Bash shell in the app container" do
      expect(cli).to receive(:system).with("docker-compose exec web bash")
      cli.bash
    end
  end
end
