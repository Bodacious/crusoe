require "spec_helper"
require "crusoe/configuration"
require "yaml"

RSpec.describe Crusoe::Configuration do
  it "#git_repo returns the correct git repository URL" do
    config = {
      "directory" => "/path/to/directory",
      "git_repo" => "https://github.com/example/repo.git"
    }
    allow(YAML).to receive(:load_file).and_return(config)
    configuration = described_class.new("/path/to/directory")
    expect(configuration.git_repo).to eq("https://github.com/example/repo.git")
  end

  it "#entries_directory_path returns the correct entries directory path" do
    allow(YAML).to receive(:load_file).and_return({
                                                    "directory" => "/path/to/directory",
                                                    "git_repo" => "https://github.com/example/repo.git"
                                                  })
    configuration = described_class.new("/path/to/directory")
    expect(configuration.entries_directory_path).to eq("/path/to/directory/entries")
  end

  it "uses DEFAULT_DIRECTORY when no directory is specified in configuration" do
    allow(YAML).to receive(:load_file).and_return({ "git_repo" => "https://github.com/example/repo.git" })
    configuration = described_class.new
    default_directory = File.join(Dir.home, ".crusoe")
    expect(configuration.entries_directory_path).to eq(File.join(default_directory, "entries"))
  end
end
