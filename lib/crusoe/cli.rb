require "thor"
require_relative "commands/git"
require_relative "commands/journal"
require_relative "commands/read"
require_relative "configuration"
require_relative "interface"

module Crusoe
  class CLI < Thor
    attr_reader :configuration
    attr_reader :interface
    private :configuration, :interface

    def initialize(...)
      @configuration = Configuration.new
      @interface = Interface.new
      super(...)
    end

    default_task :journal

    desc "journal", "This is the default task."
    option :date, type: "string", default: "today"
    def journal
      fetch_remote_repo
      date = parse_date_option(options[:date])
      write(date)
      update_remote_repo
    end

    desc "read", "Read an entry"
    option :date, type: "string", default: "today"
    def read
      update_remote_repo
      date = parse_date_option(options[:date])
      read_dates(date)
    end

    desc "report", "Generate a report for the last week"
    def report
      update_remote_repo
      today = Date.today
      days_to_last_monday = (today.wday - 1) % 7
      last_monday = today - days_to_last_monday
      read_dates(last_monday..today)
    end

    # TODO: Add command for updating the TOC file on each commit
    desc "toc", "Update the ToC on the README.md"
    def update_toc
      puts "TODO: Add GitCommit"
    end

    private

    def parse_date_option(date_option_string)
      case date_option_string
      when "today" then Date.today
      when "yesterday" then Date.today - 1
      else
        Date.parse(date_option_string)
      end
    end

    def read_dates(date_range)
      content = Commands::Read.new(
        directory: configuration.entries_directory_path,
        date_range: date_range
      ).to_s
      interface.display(content)
    end

    def write(date)
      journal = Commands::Journal.new(
        directory: configuration.entries_directory_path,
        date: date
      )
      journal.prepare_entry_file!
      interface.write(journal.entry_file_name)
    end

    def fetch_remote_repo
      Commands::Git::Checkout.new(directory: configuration.entries_directory_path).main
      Commands::Git::Pull.new(directory: configuration.entries_directory_path).main
    end

    def update_remote_repo
      Commands::Git::Add.new(directory: configuration.entries_directory_path).all
      Commands::Git::Commit.new(directory: configuration.entries_directory_path).commit!
      Commands::Git::Push.new(directory: configuration.entries_directory_path).main
    end
  end
end
