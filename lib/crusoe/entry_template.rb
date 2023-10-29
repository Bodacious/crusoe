require "pathname"
require "erb"

module Crusoe
  class EntryTemplate
    attr_reader :entry

    def initialize(entry)
      @entry = entry
    end

    def rendered_template_content
      markdown = ERB.new(template_content)
      markdown.result(entry.binding)
    end

    alias to_s rendered_template_content

    private

    def template_content
      File.read(template_path)
    end

    def template_path
      File.join(
        Pathname.new(__FILE__).dirname.realpath,
        "templates",
        "entry_template.md.erb"
      )
    end
  end
end
