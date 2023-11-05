module Crusoe
  module Commands
    module Git
      ##
      # Stages the current changes in git, commits, and pushes
      require_relative "git_command"
      class Commit < GitCommand
        attr_reader :directory

        def commit!
          git_client.commit(commit_message)
        end

        private

        def commit_message
          "Updating entry for #{Date.today}"
        end
      end
    end
  end
end
