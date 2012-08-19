require "spec_helper"

describe FontAwesome::Icon do
  subject { icon }
  let(:icon) { FontAwesome::Icon.new("pizza") }
  let(:font) { FontAwesome::Font.instance }

  describe ".new" do
    it "sets the hex code" do
      FontAwesome::Icon.new("foo").hex_code.name.should == "foo"
    end

    it "defaults the style" do
      FontAwesome::Icon.any_instance.stubs(:default_style).returns("fill:red")
      FontAwesome::Icon.new("foo").style.should == "fill:red"
    end

    it "sets the font" do
      FontAwesome::Icon.new("foo").font.should == font
    end
  end

  describe "#to_svg" do
    subject { to_svg }
    let(:to_svg) { icon.to_svg }
    let(:xml) { Nokogiri.XML to_svg }

    before do
      icon.stubs(:offset_x).returns(256)
      icon.stubs(:offset_y).returns(1792)
      icon.stubs(:path).returns("M0 0z")
      icon.stubs(:style).returns("fill:blue")
      font.stubs(:em_size).returns(2048)
    end

    it { should_not include "\n" }
    it { should_not include "<?xml" }

    it "is valid XML" do
      xml.should have(0).errors
    end

    it "contains an SVG image" do
      xml.root.name.should == "svg"
    end

    describe "returned SVG image" do
      subject { svg }
      let(:svg) { xml.root }

      it "has the correct xml namespace" do
        svg.namespace.href.should == "http://www.w3.org/2000/svg"
        svg.namespace.prefix.should be_nil
      end

      its(["version"]) { should == "1.1" }

      its(["width"]) { should == "100px" }
      its(["height"]) { should == "100px" }
      its(["viewBox"]) { should == "-256 -1792 2048 2048" }

      it { should have(1).children }

      describe "path" do
        subject { path }
        let(:path) { svg.child }

        its(:name) { should == "path" }
        its(["d"]) { should == "M0 0z" }
        its(["style"]) { should == "fill:blue" }
        its(["transform"]) { should == "rotate(180) scale(-1,1)" }
      end
    end
  end

  describe "#to_uri" do
    it "returns a data-uri for the SVG image" do
      icon.expects(:to_svg).returns("a bunch of xml")
      icon.to_uri.should == "data:image/svg+xml,a%20bunch%20of%20xml"
    end
  end

  describe ".all" do
    it "returns an array of all icons" do
      FontAwesome::HexCode.stubs(:lookup_table).returns({"pizza" => "f00d", "linux" => "f055"})
      FontAwesome::Icon.expects(:new).with("pizza").returns(:pizza)
      FontAwesome::Icon.expects(:new).with("linux").returns(:linux)

      FontAwesome::Icon.all.should == [:pizza, :linux]
    end
  end
end
