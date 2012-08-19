require "spec_helper"

describe FontAwesome::Font do
  subject(:font) { FontAwesome::Font.send :new }
  before { FontAwesome::Font.stubs(:instance).returns(font) }

  let(:hex_code) { stub("HexCode", to_unicode: "\uf00d") }

  it "should be a singleton" do
    expect{FontAwesome::Font.new}.to raise_error NoMethodError
  end

  describe "#svg" do
    it "loads the webfont" do
      Nokogiri.expects(:XML).with{|file| file.path == font.send(:path)}.returns(:parsed_xml)
      font.send(:svg).should == :parsed_xml
    end

    it "memoizes" do
      File.expects(:open).once.returns(:parsed_xml)
      font.send(:svg)
      font.send(:svg)
    end
  end

  describe "#select" do
    it "finds the first node in the webfont matching the given CSS selector" do
      font.stubs(:svg).returns(mock{expects(:at_css).with("something")})
      font.send(:select, "something")
    end
  end

  describe "#attribute" do
    let(:xml) { Nokogiri.XML('<pizza topping="meatlovers" />') }

    before { font.stubs(:svg).returns(xml) }

    context "when the attribute exists" do
      it "returns its value" do
        font.send(:attribute, "topping", "pizza").should == "meatlovers"
      end
    end

    context "when the attribute does not exist" do
      it "returns nil" do
        font.send(:attribute, "base", "pizza").should be_nil
      end
    end
  end

  describe "#glyph" do
    it "returns a selector for the specified character" do
      font.send(:glyph, hex_code).should == "glyph[unicode=\uf00d]"
    end
  end

  describe "#ascent" do
    it "returns the ascent height" do
      font.ascent.should > 0
    end
  end

  describe "#descent" do
    it "returns the descent height" do
      font.descent.should < 0
    end
  end

  describe "#em_size" do
    it "returns the number of units per em" do
      font.stubs(:attribute).with("units-per-em", "font-face").returns("2048")
      font.em_size.should == 2048
    end
  end

  describe "#character_width" do
    before { font.stubs(:attribute).with("horiz-adv-x", "glyph[unicode=\uf00d]").returns(glyph_horiz_adv_x) }

    context "when the glyph has its own horiz-adv-x" do
      let(:glyph_horiz_adv_x) { "1542" }

      it "returns it" do
        font.character_width(hex_code).should == 1542
      end
    end

    context "when the glyph does not have its own horiz-adv-x" do
      let(:glyph_horiz_adv_x) { nil }

      it "returns the font's horiz-adv-x" do
        font.stubs(:attribute).with("horiz-adv-x", "font").returns("1536")
        font.character_width(hex_code).should == 1536
      end
    end
  end

  describe "#character_outline" do
    it "returns the glyph's path" do
      font.stubs(:attribute).with("d", "glyph[unicode=\uf00d]").returns("M0 0z")
      font.character_outline(hex_code).should == "M0 0z"
    end
  end
end
