require "spec_helper"
require "crusoe/entry"
require "crusoe/entry_file_name"

RSpec.describe Crusoe::EntryFileName do
  it "#to_file_path returns the correct file path" do
    entry = instance_double("Crusoe::Entry", date: Date.parse('2023-10-28'))
    entries_directory = "/path/to/entries"
    entry_file_name = described_class.new(entry, entries_directory)
    expected_file_path = "/path/to/entries/2023-10/2023-10-28.md"

    expect(entry_file_name.to_file_path).to eq(expected_file_path)
  end

  it "#to_s method is aliased to to_file_path" do
    entry = instance_double("Crusoe::Entry", date: Date.parse('2023-10-28'))
    entries_directory = "/path/to/entries"
    entry_file_name = described_class.new(entry, entries_directory)

    expect(entry_file_name.to_s).to eq(entry_file_name.to_file_path)
  end
end
