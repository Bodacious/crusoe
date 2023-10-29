require "spec_helper"
require "crusoe/entry"
require "date"

RSpec.describe Crusoe::Entry do
  it "#year returns the correct year" do
    date = Date.new(2023, 10, 28)
    entry = described_class.new(date)
    expect(entry.year).to eq(2023)
  end

  it "#month returns the correct month" do
    date = Date.new(2023, 10, 28)
    entry = described_class.new(date)
    expect(entry.month).to eq(10)
  end

  it "#day returns the correct day" do
    date = Date.new(2023, 10, 28)
    entry = described_class.new(date)
    expect(entry.day).to eq(28)
  end

  it "initializes with current date when no date is provided" do
    entry = described_class.new
    expect(entry.date).to eq(Date.today)
  end
end
