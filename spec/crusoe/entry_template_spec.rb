require "spec_helper"
require "crusoe/entry"
require "crusoe/entry_template"
require "date"

RSpec.describe Crusoe::EntryTemplate do
  it "#rendered_template_content returns content with entry data" do
    date = Date.new(2023, 10, 28)
    entry = Crusoe::Entry.new(date)
    entry_template = described_class.new(entry)

    expect(entry_template.rendered_template_content).to eq <<~STRING
      # What I did Today (2023-10-28)

      ## Challenges faced

      ## Notes
    STRING
  end

  it "#to_s is aliased to #rendered_template_content" do
    date = Date.new(2023, 10, 28)
    entry = Crusoe::Entry.new(date)
    entry_template = described_class.new(entry)

    expect(entry_template.to_s).to eq(entry_template.rendered_template_content)
  end
end
