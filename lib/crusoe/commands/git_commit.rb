require "git"
module Crusoe
  module Commands
    class GitCommit
      GIT_BRANCH = "main".freeze
      REMOTE_NAME = "origin".freeze

      attr_reader :directory

      def initialize(directory:)
        @directory = directory
      end

      def commit_and_push!
        add_a
        commit!
        push_to_remote_origin_main
      end

      private

      def git_client
        return @git_client if defined?(@git_client)

        (Git.init(directory) unless File.directory?(File.join(directory, ".git")))

        @git_client = Git.open(directory)
      end

      def remote_origin
        git_client.remote(REMOTE_NAME)
      end

      def checkout_main
        git_client.checkout(GIT_BRANCH)
      end

      def add_a
        git_client.add(all: true)
      end

      def commit_message
        "Updating entry for #{Date.today}"
      end

      def commit!
        git_client.commit(commit_message)
      end

      def push_to_remote_origin_main
        git_client.push(remote_origin, GIT_BRANCH)
      end
    end
  end
end
