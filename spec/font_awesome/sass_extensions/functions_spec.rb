require 'spec_helper'

describe FontAwesome::SassExtensions::Functions do
  class EvaluationContext
    def self.declare(*args)
      declarations << args
    end

    def self.declarations
      @declarations ||= []
    end

    def assert_type(*args)
    end

    include FontAwesome::SassExtensions::Functions
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
    let(:icon) { stub("Icon", to_uri: "uri") }

    before { FontAwesome::Icon.stubs(:new).with("foo").returns(icon) }

    it "requires that $name be a string" do
      functions.expects(:assert_type).with(name, :String)
      icon_image
    end

    it "returns a data-uri representation of the icon" do
      icon_image.should == Sass::Script::String.new("uri")
    end

    it "quotes the returned string" do
      icon_image.type.should == :string
    end
  end

  describe "icon-image($name, $style)" do
    subject(:icon_image) { functions.icon_image(name, style) }
    let(:name) { Sass::Script::String.new("foo") }
    let(:style) { Sass::Script::String.new("fill:blue") }
    let(:icon) { stub("Icon", :style= => nil, to_uri: "uri") }

    before { FontAwesome::Icon.stubs(:new).with("foo").returns(icon) }

    it "requires that $name and $style be strings" do
      functions.expects(:assert_type).with(name, :String)
      functions.expects(:assert_type).with(style, :String)
      icon_image
    end

    it "sets the icon style" do
      icon.expects(:style=).with("fill:blue")
      icon_image
    end

    it "returns a data-uri representation of the icon" do
      icon_image.should == Sass::Script::String.new("uri")
    end

    it "quotes the returned string" do
      icon_image.type.should == :string
    end
  end

  it "declares icon-character($name)" do
    EvaluationContext.declarations.should include [:icon_character, [:name]]
  end

  describe "icon-character($name)" do
    subject(:icon_character) { functions.icon_character(name) }
    let(:name) { Sass::Script::String.new("pizza") }
    let(:hex_code) { stub("HexCode", to_css: "\\f00d") }

    before { FontAwesome::HexCode.stubs(:new).with("pizza").returns(hex_code) }

    it "requires that $name be a string" do
      functions.expects(:assert_type).with(name, :String)
      icon_character
    end

    it "returns the css-formatted hex code for the icon" do
      icon_character.should == Sass::Script::String.new("\\f00d")
    end

    it "quotes the returned string" do
      icon_character.type.should == :string
    end
  end
end
