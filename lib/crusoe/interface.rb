module Crusoe
  class Interface
    def display(content)
      $stdout.puts content
    end

    def write(file_name)
      system("#{editor_exe} #{editor_options} #{file_name}")
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
