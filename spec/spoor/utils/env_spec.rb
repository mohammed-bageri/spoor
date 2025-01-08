# frozen_string_literal: true

require "spec_helper"

RSpec.describe Spoor::Utils::Env do
  describe ".detect_ruby_version" do
    let(:temp_dir) { Dir.mktmpdir }

    before { Dir.chdir(temp_dir) }
    after { FileUtils.remove_entry(temp_dir) }

    it "detects Ruby version from .ruby-version" do
      File.write(".ruby-version", "3.1.2\n")
      expect(described_class.detect_ruby_version).to eq("3.1.2")
    end

    it "detects Ruby version from Gemfile" do
      File.write("Gemfile", 'ruby "3.0.0"')
      expect(described_class.detect_ruby_version).to eq("3.0.0")
    end

    it "defaults to 3.2.0 if no version is found" do
      expect(described_class.detect_ruby_version).to eq("3.2.0")
    end
  end
end
