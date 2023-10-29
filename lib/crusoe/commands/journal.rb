require_relative "../../crusoe/entry"
require_relative "../../crusoe/entry_file"
require_relative "../../crusoe/entry_file_name"
require_relative "../../crusoe/entry_template"
module Crusoe
  module Commands
    class Journal
      attr_reader :entry
      attr_reader :directory

      def initialize(directory:, entry: Crusoe::Entry.new)
        @entry = entry
        @directory = directory
      end

      def submit!
        entry_file_name = EntryFileName.new(entry, directory)
        EntryFile.create_unless_exist(entry_file_name) do |file|
          file_content = EntryTemplate.new(entry).to_s
          file.write(file_content)
        end
        system("#{editor_exe} #{editor_options} #{entry_file_name}")

        # GitCommit.new.commit!
      end

      def editor_exe
        "${EDITOR:-vi}"
      end

      def editor_options
        "-w"
      end
    end
  end
end
