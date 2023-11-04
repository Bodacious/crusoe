require "date"

module Crusoe
  class Entry
    attr_reader :date

    public :binding

    def initialize(date = Date.today)
      @date = date
    end
  end
end
