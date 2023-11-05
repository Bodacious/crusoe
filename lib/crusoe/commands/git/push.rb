module Crusoe
  module Commands
    module Git
      require_relative "remote_git_command"
      class Push < RemoteGitCommand
        def main
          git_client.push(remote_origin, MAIN_GIT_BRANCH)
        end
      end
    end
  end
end
