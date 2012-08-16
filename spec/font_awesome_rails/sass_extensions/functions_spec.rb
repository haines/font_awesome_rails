require 'spec_helper'

describe FontAwesomeRails::SassExtensions::Functions do
  class EvaluationContext
    def self.declare(*args)
      declarations << args
    end

    def self.declarations
      @declarations ||= []
    end

    include FontAwesomeRails::SassExtensions::Functions
  end

  let(:functions) { EvaluationContext.new }

  it "declares icon-image($name)" do
    EvaluationContext.declarations.should include [:icon_image, [:name]]
  end

  it "declares icon-image($name, $style)" do
    EvaluationContext.declarations.should include [:icon_image, [:name, :style]]
  end

  describe "icon-image($name)" do
    subject(:icon_image) { functions.icon_image(name) }
    let(:name) { Sass::Script::String.new("foo") }

    before do
      FontAwesomeRails::Glyph.stubs(:new).returns(stub_everything)
      functions.stubs(:assert_type)
    end

    it "requires that $name be a string" do
      functions.expects(:assert_type).with(name, :String)
      icon_image
    end

    it "returns a data-uri containing an SVG rendering of the named icon" do
      FontAwesomeRails::Glyph.expects(:new).with("foo", nil).returns(mock(to_uri: "uri"))
      icon_image.should == Sass::Script::String.new("uri")
    end
  end

  describe "icon-image($name, $style)" do
    subject(:icon_image) { functions.icon_image(name, style) }
    let(:name) { Sass::Script::String.new("foo") }
    let(:style) { Sass::Script::String.new("fill:blue") }

    before do
      FontAwesomeRails::Glyph.stubs(:new).returns(stub_everything)
      functions.stubs(:assert_type)
    end

    it "requires that $name be a string" do
      functions.expects(:assert_type).with(name, :String)
      icon_image
    end

    it "requires that $style be a string" do
      functions.expects(:assert_type).with(style, :String)
      icon_image
    end

    it "returns a data-uri containing an SVG rendering of the named icon with the given style" do
      FontAwesomeRails::Glyph.expects(:new).with("foo", "fill:blue").returns(mock(to_uri: "uri"))
      icon_image.should == Sass::Script::String.new("uri")
    end
  end
end
