require 'spec_helper'
require_relative '../lib/gilded_rose'

RSpec.describe GildedRose do
  describe "#update_quality" do
    it "does not change the name" do
      items = [Item.new("foo", 0, 0)]

      GildedRose.new(items).update_quality

      expect(items[0].name).to eq "foo"
    end

    it "does stuff" do
      verify do
        items = [Item.new("Aged Brie", 0, 0)]
        gilded_rose = GildedRose.new(items)

        gilded_rose.update_quality

        gilded_rose.items.map(&:to_s)
      end
    end
  end
end
