require "spec_helper"

describe FontAwesomeRails::Icon do
  subject(:icon) { FontAwesomeRails::Icon.new(name) }
  let(:name) { :hamburger }
  before { icon.stubs(:hex_code).returns("f00d") }

  describe ".new" do
    it "sets the name" do
      FontAwesomeRails::Icon.new(:foo).name.should == :foo
    end
  end

  describe "#hex_code" do
    before do
      icon.unstub :hex_code
      FontAwesomeRails::Icon.expects(:lookup_table).returns(mock{expects(:[]).with("some-icon").returns("f00d")})
    end

    context "when name is dasherized" do
      let(:name) { "some-icon" }

      it "looks up the name" do
        icon.hex_code.should == "f00d"
      end
    end

    context "when name is underscored" do
      let(:name) { "some_icon" }

      it "looks up the dasherized name" do
        icon.hex_code.should == "f00d"
      end
    end

    context "when name is an underscored symbol" do
      let(:name) { :some_icon }

      it "looks up the dasherized stringified name" do
        icon.hex_code.should == "f00d"
      end
    end
  end

  describe "#to_unicode" do
    it "returns the unicode character for the hex code" do
      icon.to_unicode.should == "\uf00d"
    end
  end

  describe "#to_css" do
    it "returns the css-escaped hex code" do
      icon.to_css.should == '\f00d'
    end
  end

  describe "#to_xml" do
    it "returns the xml entity for the hex code" do
      icon.to_xml.should == "&#xf00d;"
    end
  end

  describe "#to_scss_placeholder" do
    it "returns a placeholder rule for a pseudoelement containing the icon" do
      icon.to_scss_placeholder.should == "%icon-hamburger { content: '\\f00d'; }"
    end
  end

  describe "#to_scss_class" do
    it "returns a class rule to prepend the icon" do
      icon.to_scss_class.should == ".icon-hamburger:before { @extend %icon-hamburger; }"
    end
  end

  describe ".all" do
    it "returns an array of Icons" do
      FontAwesomeRails::Icon.stubs(:lookup_table).returns({"hamburger" => "f00d", "linux" => "f055"})
      FontAwesomeRails::Icon.expects(:new).with("hamburger").returns(:hamburger)
      FontAwesomeRails::Icon.expects(:new).with("linux").returns(:linux)

      FontAwesomeRails::Icon.all.should == [:hamburger, :linux]
    end
  end
end
