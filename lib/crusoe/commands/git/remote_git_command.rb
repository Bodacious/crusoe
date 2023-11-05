module Crusoe
  module Commands
    module Git
      require_relative "git_command"
      class RemoteGitCommand < GitCommand
        REMOTE_NAME = "origin".freeze

        private

        def remote_origin
          git_client.remote(REMOTE_NAME)
        end
      end
    end
  end
end
