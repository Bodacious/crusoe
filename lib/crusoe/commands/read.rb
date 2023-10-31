require_relative "../../crusoe/entry"
require_relative "../../crusoe/entry_file"
require_relative "../../crusoe/entry_file_name"
require_relative "../../crusoe/entry_template"
module Crusoe
  module Commands
    class Read
      attr_reader :date_range
      attr_reader :directory

      DAY_SEPARATOR = "\n\n"
      JOURNAL_FILE_DATE_REGEX = %r{/(?<date>\d{4}-\d{2}-\d{2})\.md$}.freeze

      def initialize(directory:, date_range:)
        @directory = directory
        @date_range = date_range
      end

      def to_s
        files.map { File.read(_1) }.join(DAY_SEPARATOR)
      end

      private

      def files
        Dir.glob(File.join(directory, "*", "*.md")).
          select do |file|
            match_data = file.match(JOURNAL_FILE_DATE_REGEX)
            file_date = Date.parse(match_data[:date])
            date_range.include?(file_date)
          end
      end
    end
  end
end
