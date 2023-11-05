module Crusoe
  module Commands
    module Git
      ##
      # Stages the current changes in git, commits, and pushes
      require_relative "remote_git_command"
      class Pull < RemoteGitCommand
        def main
          git_client.pull(remote_origin, MAIN_GIT_BRANCH)
        end
      end
    end
  end
end
