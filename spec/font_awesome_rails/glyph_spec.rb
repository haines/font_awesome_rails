require "spec_helper"

describe FontAwesomeRails::Glyph do
  subject { glyph }
  let(:glyph) { FontAwesomeRails::Glyph.new("some-icon") }
  let(:font) { FontAwesomeRails::Font.instance }

  describe ".new" do
    it "sets the name" do
      FontAwesomeRails::Glyph.new("foo").name.should == "foo"
    end

    context "when style is given" do
      it "sets the style" do
        FontAwesomeRails::Glyph.new("foo", "fill:blue").style.should == "fill:blue"
      end
    end

    context "when style is not given" do
      it "sets the style to the default" do
        FontAwesomeRails::Glyph.new("foo").style.should == "fill:black"
      end
    end

    it "sets the font" do
      FontAwesomeRails::Glyph.new("bar").font.should == font
    end
  end

  describe "#icon" do
    it "returns the corresponding Icon" do
      FontAwesomeRails::Icon.expects(:new).with("some-icon").returns(:icon)
      glyph.icon.should == :icon
    end
  end

  describe "#attribute" do
    let(:xml) { Nokogiri.XML('<hamburger><bun topping="sesame" /></hamburger>') }

    context "without a selector" do
      it "selects on the appropriate glyph node" do
        glyph.stubs(:icon).returns(stub(to_unicode: "\uf00d"))
        font.expects(:select).with("glyph[unicode=\uf00d]").returns(stub_everything)
        glyph.attribute("attr")
      end
    end

    context "with a selector" do
      it "selects on the given selector" do
        font.expects(:select).with("selector").returns(stub_everything)
        glyph.attribute("attr", "selector")
      end
    end

    context "when the attribute exists" do
      before { font.stubs(:svg).returns(xml) }
      it "returns its value" do
        glyph.attribute("topping", "hamburger bun").should == "sesame"
      end
    end

    context "when the attribute does not exist" do
      before { font.stubs(:svg).returns(xml) }
      it "returns nil" do
        glyph.attribute("foo", "hamburger").should be_nil
      end
    end
  end

  describe "#width" do
    context "when the glyph has its own horiz-adv-x" do
      it "returns the glyph's horiz-adv-x" do
        glyph.stubs(:attribute).with("horiz-adv-x").returns("123")
        glyph.width.should == 123
      end
    end

    context "when the glyph does not have its own horiz-adv-x" do
      it "returns the font's horiz-adv-x" do
        glyph.stubs(:attribute).with("horiz-adv-x").returns(nil)
        glyph.stubs(:attribute).with("horiz-adv-x", "font").returns("456")
        glyph.width.should == 456
      end
    end
  end

  describe "#height" do
    it "returns the font-face's units-per-em" do
      glyph.stubs(:attribute).with("units-per-em", "font-face").returns("789")
      glyph.height.should == 789
    end
  end

  describe "#ascent" do
    it "returns the font-face's ascent" do
      glyph.stubs(:attribute).with("ascent", "font-face").returns("789")
      glyph.ascent.should == 789
    end
  end

  describe "#path" do
    it "returns the glyph's d" do
      glyph.stubs(:attribute).with("d").returns("M0 0z")
      glyph.path.should == "M0 0z"
    end
  end

  describe "#offset_x" do
    it "returns the viewport x-offset for centering" do
      glyph.stubs(:width).returns(1536)
      glyph.stubs(:height).returns(2048)
      glyph.offset_x.should == -256
    end
  end

  describe "#offset_y" do
    it "returns the viewport y-offset for centering" do
      glyph.stubs(:ascent).returns(1536)
      glyph.stubs(:height).returns(2048)
      glyph.offset_y.should == -1792
    end
  end

  describe "#to_svg" do
    subject { to_svg }
    let(:to_svg) { glyph.to_svg }
    let(:xml) { Nokogiri.XML to_svg }

    before do
      glyph.stubs(:offset_x).returns(-256)
      glyph.stubs(:offset_y).returns(-1792)
      glyph.stubs(:height).returns(2048)
      glyph.stubs(:path).returns("M0 0z")
      glyph.stubs(:style).returns("fill:blue")
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
      glyph.expects(:to_svg).returns("some xml")
      glyph.to_uri.should == "data:image/svg+xml,some%20xml"
    end
  end
end
