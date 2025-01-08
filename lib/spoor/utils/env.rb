# frozen_string_literal: true

module Spoor
  module Utils
    # Environment utilities
    module Env
      def self.detect_ruby_version
        return File.read(".ruby-version").strip if File.exist?(".ruby-version")

        if File.exist?("Gemfile")
          gemfile_content = File.read("Gemfile")
          if (match = gemfile_content.match(/ruby ['"]([^'"]+)['"]/))
            return match[1]
          end
        end

        "3.2.0"
      end
    end
  end
end
