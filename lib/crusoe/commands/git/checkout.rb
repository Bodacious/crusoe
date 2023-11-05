require_relative "git_command"
module Crusoe
  module Commands
    module Git
      ##
      # Stages the current changes in git, commits, and pushes
      require_relative "git_command"
      class Checkout < GitCommand
        MAIN_GIT_BRANCH = "main".freeze

        def main
          git_client.checkout(MAIN_GIT_BRANCH)
        end
      end
    end
  end
end
