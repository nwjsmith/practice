require_relative '../lib/gilded_rose'
require 'approvals/rspec'

RSpec.describe GildedRose do
  describe "#update_quality" do
    it "does not change the name" do
      items = [Item.new("foo", 0, 0)]

      GildedRose.new(items).update_quality

      expect(items.first.name).to eq "foo"
    end

    it "is characterized" do
      verify do
        items = [Item.new("foo", 0, 0)]

        GildedRose.new(items).update_quality

        items
      end
    end
  end
end
