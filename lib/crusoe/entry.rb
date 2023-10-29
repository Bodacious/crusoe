module Crusoe
  class Entry
    attr_reader :date

    public :binding

    def initialize(date = Date.today)
      @date = date
    end

    def year
      date.year
    end

    def month
      date.month
    end

    def day
      date.day
    end
  end
end
