module Crusoe
  class EntryFile
    attr_reader :entry_file_name
    attr_reader :content

    def self.create_unless_exist(entry_file_name, content = "")
      entry_file = new(entry_file_name)

      return if entry_file.exist?

      entry_file.write(content)
    end

    def initialize(entry_file_name)
      @entry_file_name = entry_file_name.to_s
      @content = content
    end

    def exist?
      File.exist?(entry_file_name)
    end

    def write(content)
      dir_path = File.dirname(entry_file_name.to_s)
      FileUtils.mkdir_p(dir_path)
      File.write(entry_file_name.to_s, content)
    end
  end
end
