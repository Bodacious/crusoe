require "date"

module Crusoe
  class Entry
    attr_reader :date, :year, :month, :day

    public :binding

    def initialize(date = Date.today)
      @date = date
      @year, @month, @day = *date.to_s.split("-")
    end
  end
end
