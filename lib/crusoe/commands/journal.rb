require_relative "../../crusoe/entry"
require_relative "../../crusoe/entry_file"
require_relative "../../crusoe/entry_file_name"
require_relative "../../crusoe/entry_template"
module Crusoe
  module Commands
    class Journal
      attr_reader :entry
      attr_reader :directory

      def initialize(directory:, date: Date.today)
        @entry = Crusoe::Entry.new(date)
        @directory = directory
      end

      def submit!
        entry_file_name = EntryFileName.new(entry, directory)
        file_content = EntryTemplate.new(entry).to_s
        EntryFile.create_unless_exist(entry_file_name, file_content)
        system("#{editor_exe} #{editor_options} #{entry_file_name}")
      end

      private

      def editor_exe
        "${EDITOR:-vi}"
      end

      def editor_options
        "-w"
      end
    end
  end
end
