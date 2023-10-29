# frozen_string_literal: true

require_relative "lib/crusoe/version"

Gem::Specification.new do |spec|
  spec.name = "crusoe"
  spec.version = Crusoe::VERSION
  spec.authors = ["Gavin Morrice"]
  spec.email = ["gavin@gavinmorrice.com"]

  spec.summary = "A journaling tool for developers."
  spec.description = "Crusoe is a gem that helps you keep track of your daily work and thoughts in Markdown files. It automates the process of creating, updating, and organising these files."
  spec.homepage = "https://github.com/bodacious/crusoe"
  spec.license = "MIT"
  spec.required_ruby_version = ">= 3.2"

  spec.metadata["allowed_push_host"] = "https://rubygems.org"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/bodacious/crusoe"
  spec.metadata["changelog_uri"] = "https://github.com/bodacious/crusoe/CHANGELOG.md"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(__dir__) do
    `git ls-files -z`.split("\x0").reject do |f|
      (File.expand_path(f) == __FILE__) ||
        f.start_with?(*%w[bin/ spec/ .git .circleci]) ||
        f.end_with?(*%w[.gem])
    end
  end
  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]
  spec.add_dependency "git"
  spec.add_dependency "thor"
  spec.add_dependency "yaml"
  spec.metadata["rubygems_mfa_required"] = "true"
end
