require_relative "../../crusoe/entry"
require_relative "../../crusoe/entry_file"
require_relative "../../crusoe/entry_file_name"
require_relative "../../crusoe/entry_template"
module Crusoe
  module Commands
    class Journal
      attr_reader :entry_file_name
      attr_reader :default_file_content

      def initialize(directory:, date: Date.today)
        entry = Crusoe::Entry.new(date)
        @entry_file_name = EntryFileName.new(entry, directory).to_s
        @default_file_content = EntryTemplate.new(entry).to_s
      end

      def prepare_entry_file!
        EntryFile.create_unless_exist(entry_file_name, default_file_content)
      end
    end
  end
end
