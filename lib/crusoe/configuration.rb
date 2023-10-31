module Crusoe
  class Configuration
    require "yaml"

    DEFAULT_DIRECTORY = File.join(Dir.home, ".crusoe")
    ENTRIES_DIRECTORY_NAME = "entries".freeze
    CONFIGURATION_FILE_NAME = "config.yml".freeze

    attr_reader :git_repo
    attr_reader :entries_directory_path

    def initialize(base_directory_path = DEFAULT_DIRECTORY)
      configuration_file_path = File.join(base_directory_path, CONFIGURATION_FILE_NAME)
      configs = YAML.load_file(configuration_file_path)
      @directory = configs["directory"] || DEFAULT_DIRECTORY
      @git_repo = configs["git_repo"]
      @entries_directory_path = File.join(base_directory_path, ENTRIES_DIRECTORY_NAME)
    end
  end
end
