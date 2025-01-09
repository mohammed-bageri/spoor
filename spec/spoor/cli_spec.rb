# frozen_string_literal: true

require "spec_helper"

RSpec.describe Spoor::CLI do # rubocop:disable Metrics/BlockLength
  let(:cli) { described_class.new }

  describe "command registration" do # rubocop:disable Metrics/BlockLength
    it "registers the 'install' command" do
      expect(cli.class.commands.keys).to include("install")
    end

    it "registers the 'up' command" do
      expect(cli.class.commands.keys).to include("up")
    end

    it "registers the 'down' command" do
      expect(cli.class.commands.keys).to include("down")
    end

    it "registers the 'rails' command" do
      expect(cli.class.commands.keys).to include("rails")
    end

    it "registers the 'bundle' command" do
      expect(cli.class.commands.keys).to include("bundle")
    end

    it "registers the 'rake' command" do
      expect(cli.class.commands.keys).to include("rake")
    end

    it "registers the 'psql' command" do
      expect(cli.class.commands.keys).to include("psql")
    end

    it "registers the 'redis' command" do
      expect(cli.class.commands.keys).to include("redis")
    end

    it "registers the 'bash' command" do
      expect(cli.class.commands.keys).to include("bash")
    end
  end

  describe "#install" do
    it "calls the Install command" do
      expect_any_instance_of(Spoor::Commands::Install).to receive(:install)
      cli.invoke("install")
    end
  end

  describe "#up" do
    it "calls the Up command" do
      expect_any_instance_of(Spoor::Commands::Up).to receive(:up)
      cli.invoke("up")
    end
  end

  describe "#down" do
    it "calls the Down command" do
      expect_any_instance_of(Spoor::Commands::Down).to receive(:down)
      cli.invoke("down")
    end
  end

  describe "#rails" do
    it "calls the Rails command" do
      expect_any_instance_of(Spoor::Commands::Rails).to receive(:rails).with("server")
      cli.invoke("rails", ["server"])
    end
  end

  describe "#bundle" do
    it "calls the Bundle command" do
      expect_any_instance_of(Spoor::Commands::Bundle).to receive(:bundle).with("install")
      cli.invoke("bundle", ["install"])
    end
  end

  describe "#rake" do
    it "calls the Rake command" do
      expect_any_instance_of(Spoor::Commands::Rake).to receive(:rake).with("db:migrate")
      cli.invoke("rake", ["db:migrate"])
    end
  end

  describe "#psql" do
    it "calls the Psql command" do
      expect_any_instance_of(Spoor::Commands::Psql).to receive(:psql)
      cli.invoke("psql")
    end
  end

  describe "#redis" do
    it "calls the Redis command" do
      expect_any_instance_of(Spoor::Commands::Redis).to receive(:redis)
      cli.invoke("redis")
    end
  end

  describe "#bash" do
    it "calls the Bash command" do
      expect_any_instance_of(Spoor::Commands::Bash).to receive(:bash)
      cli.invoke("bash")
    end
  end
end
