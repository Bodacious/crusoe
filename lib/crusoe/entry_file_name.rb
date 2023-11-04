module Crusoe
  class EntryFileName
    attr_reader :entry
    attr_reader :entries_directory

    def initialize(entry, entries_directory)
      @entry = entry
      @entries_directory = entries_directory
    end

    def to_file_path
      File.join(entries_directory,
                month_directory_name,
                file_name) + file_format
    end

    alias to_s to_file_path

    private

    def month_directory_name
      entry.date.to_s
    end

    def file_name
      entry.date.to_s
    end

    def file_format
      ".md"
    end
  end
end
