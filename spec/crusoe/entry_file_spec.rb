require "spec_helper"
require "fileutils"
require "crusoe/entry_file"

RSpec.describe Crusoe::EntryFile do
  describe ".create_unless_exist" do
    it "does not write to the file if it already exists" do
      entry_file_name = "/path/to/entry/file.md"
      allow(File).to receive(:exist?).and_return(true)

      expect_any_instance_of(described_class).not_to receive(:write)

      described_class.create_unless_exist(entry_file_name, "Content")
    end

    it "writes to the file if it does not exist" do
      entry_file_name = "/path/to/entry/file.md"
      allow(File).to receive(:exist?).and_return(false)

      expect_any_instance_of(described_class).to receive(:write).with("Content")

      described_class.create_unless_exist(entry_file_name, "Content")
    end
  end

  describe "#exist?" do
    it "checks if the file exists" do
      entry_file = described_class.new("/path/to/entry/file.md")

      allow(File).to receive(:exist?).and_return(true)

      expect(entry_file.exist?).to be true
    end
  end

  describe "#write" do
    it "creates the directory and writes to the file" do
      entry_file_name = "/path/to/entry/file.md"
      entry_file = described_class.new(entry_file_name)

      expect(FileUtils).to receive(:mkdir_p).with("/path/to/entry")
      expect(File).to receive(:write).with(entry_file_name, "Content")

      entry_file.write("Content")
    end
  end
end
