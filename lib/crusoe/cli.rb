require "thor"
require_relative "commands/git_commit"
require_relative "commands/journal"
require_relative "commands/read"
require_relative "configuration"
require_relative "interface"

module Crusoe
  class CLI < Thor
    default_task :today

    desc "today", "This is the default task."
    def today
      journal(Date.today)
      update_repo
    end

    desc "yesterday", "Edit yesterday's entry"
    def yesterday
      journal(Date.today - 1)
      update_repo
    end

    desc "week", "Generate a report for the last week"
    def week
      today = Date.today
      days_to_last_monday = (today.wday - 1) % 7
      last_monday = today - days_to_last_monday
      read(last_monday..today)
    end

    # TODO: Add command for updating the TOC file on each commit
    desc "toc", "Update the ToC on the README.md"
    def update_toc
      puts "TODO: Add GitCommit"
    end

    private

    def read(date_range)
      content = Commands::Read.new(
        directory: configuration.entries_directory_path,
        date_range: date_range
      ).to_s
      Interface.new.display(content)
    end

    def journal(date)
      Commands::Journal.new(
        directory: configuration.entries_directory_path,
        date: date
      ).submit!
    end

    def update_repo
      Commands::GitCommit.new(directory: configuration.entries_directory_path).commit_and_push!
    end

    def configuration
      @configuration ||= Configuration.new
    end
  end
end
