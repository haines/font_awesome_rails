require "spec_helper"

describe FontAwesome::HexCode do
  subject(:hex_code) { FontAwesome::HexCode.new(name) }
  let(:name) { :pizza }
  before { FontAwesome::HexCode.stubs(:lookup_table).returns({"pizza" => "f00d"}) }

  describe ".new" do
    it "sets the name" do
      FontAwesome::HexCode.any_instance.expects(:name=).with(:foo)
      FontAwesome::HexCode.new(:foo)
    end
  end

  describe "#name=" do
    it "stringifies and dasherizes the name" do
      ["some-icon", "some_icon", :some_icon].each do |value|
        hex_code.name = value
        hex_code.name.should == "some-icon"
      end
    end
  end

  describe "#to_s" do
    it "looks up the name in the lookup table" do
      FontAwesome::HexCode.expects(:lookup_table).returns(mock{expects(:[]).with("pizza").returns("f00d")})
      hex_code.to_s.should == "f00d"
    end
  end

  describe "#to_unicode" do
    it "unicode-escapes the hex code" do
      hex_code.to_unicode.should == "\uf00d"
    end
  end

  describe "#to_css" do
    it "css-escapes the hex code" do
      hex_code.to_css.should == '\f00d'
    end
  end

  describe "#to_xml" do
    it "xml-escapes the hex code" do
      hex_code.to_xml.should == "&#xf00d;"
    end
  end

  describe ".all" do
    it "returns an enumerator for the lookup table" do
      FontAwesome::HexCode.all.to_a.should == FontAwesome::HexCode.lookup_table.each.to_a
    end
  end

  describe ".lookup_table" do
    subject(:lookup_table) { FontAwesome::HexCode.lookup_table }

    before { FontAwesome::HexCode.unstub :lookup_table}

    it { should be_a Hash }

    it "translates icon names to hex codes" do
      lookup_table["glass"].should == "f000"
    end
  end
end
