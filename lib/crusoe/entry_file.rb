module Crusoe
  class EntryFile
    attr_reader :entry_file_name

    def self.create_unless_exist(entry_file_name, &block)
      return if File.exist?(entry_file_name.to_s)

      new(entry_file_name).create!(block)
    end

    def initialize(entry_file_name)
      @entry_file_name = entry_file_name
    end

    def create!(block)
      FileUtils.mkdir_p(File.dirname(entry_file_name.to_s))
      File.open(entry_file_name.to_s, "w") do |file|
        block.yield(file)
      end
    end
  end
end
