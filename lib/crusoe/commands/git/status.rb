# frozen_string_literal: true

module Crusoe
  module Commands
    module Git
      class Status < GitCommand
        def empty?
          # TODO: Clean this up
          git_client.status.changed.empty?
        end
      end
    end
  end
end
