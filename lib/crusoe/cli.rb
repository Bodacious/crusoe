require "thor"
require_relative "commands/git_commit"
require_relative "commands/journal"
require_relative "configuration"

module Crusoe
  class CLI < Thor
    default_task :journal

    desc "journal", "This is the default task."
    def journal
      Commands::Journal.new(directory: configuration.entries_directory_path).submit!
      update_repo
    end

    desc "week", 'Generate a report for the last week'
    def week
        puts "Generating a weekly report..."
    end

    # TODO: Add command for updating the TOC file on each commit
    desc "toc", "Update the ToC on the README.md"
    def update_toc
      puts "TODO: Add GitCommit"
    end

    desc "update_repo", "Update the remote git repo with changes"
    def update_repo
      Commands::GitCommit.new(directory: configuration.entries_directory_path).commit_and_push!
    end

    private

    def configuration
      @configuration ||= Configuration.new
    end
  end
end
