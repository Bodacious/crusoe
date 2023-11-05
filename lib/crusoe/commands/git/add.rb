module Crusoe
  module Commands
    module Git
      require_relative "git_command"
      class Add < GitCommand
        def all
          git_client.add(all: true)
        end
      end
    end
  end
end
