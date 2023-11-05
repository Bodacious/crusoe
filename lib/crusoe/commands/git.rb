module Crusoe
  module Commands
    module Git
      require_relative "git/add"
      require_relative "git/checkout"
      require_relative "git/commit"
      require_relative "git/pull"
      require_relative "git/push"
    end
  end
end
