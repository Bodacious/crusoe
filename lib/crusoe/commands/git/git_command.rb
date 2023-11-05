module Crusoe
  module Commands
    module Git
      class GitCommand
        require "git"

        MAIN_GIT_BRANCH = "main".freeze

        attr_reader :directory

        def initialize(directory:)
          super()
          @directory = directory
        end

        private

        def git_client
          return @git_client if defined?(@git_client)

          (Git.init(directory) unless File.directory?(File.join(directory, ".git")))

          @git_client = ::Git.open(directory)
        end
      end
    end
  end
end
