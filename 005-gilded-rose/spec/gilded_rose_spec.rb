require_relative '../lib/gilded_rose'
require 'approvals/rspec'

RSpec.describe GildedRose do
  describe "#update_quality" do
    it "does not change the name" do
      items = [Item.new("foo", 0, 0)]

      GildedRose.new(items).update_quality

      expect(items[0].name).to eq "foo"
    end

    it 'is characterized' do
      verify do
        names = ["foo", "Aged Brie", "Backstage passes to a TAFKAL80ETC concert", "Sulfuras, Hand of Ragnaros"]
        qualities = [-1, 0, 1, 49, 50, 51]
        sell_ins = [-1, 0, 1, 5, 6, 7, 10, 11, 12]
        items = names.product(qualities, sell_ins).map { |name, quality, sell_in|
          Item.new(name, quality, sell_in)
        }

        GildedRose.new(items).update_quality

        items.map(&:to_s)
      end
    end
  end
end
