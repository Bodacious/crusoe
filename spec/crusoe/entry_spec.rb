require "spec_helper"
require "crusoe/entry"
require "date"

RSpec.describe Crusoe::Entry do
  it "initializes with current date when no date is provided" do
    entry = described_class.new
    expect(entry.date).to eq(Date.today)
  end
end
