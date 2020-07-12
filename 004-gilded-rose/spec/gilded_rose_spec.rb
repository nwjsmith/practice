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
        names = [
          "foo",
          "Aged Brie",
          "Backstage passes to a TAFKAL80ETC concert",
          "Sulfuras, Hand of Ragnaros"
        ]
        sell_ins = [-1, 0, 1]
        qualities = [0]
        items = names.product(sell_ins, qualities).map { |name, sell_in, quality|
          Item.new(name, sell_in, quality)
        }

        GildedRose.new(items).update_quality

        items.map(&:to_s)
      end
    end
  end
end
