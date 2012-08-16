require "spec_helper"

describe FontAwesomeRails::Font do
  subject(:font) { FontAwesomeRails::Font.send :new }
  before { FontAwesomeRails::Font.stubs(:instance).returns(font) }

  it "should be a singleton" do
    expect{FontAwesomeRails::Font.new}.to raise_error NoMethodError
  end

  describe "#svg" do
    it "loads the webfont" do
      Nokogiri.expects(:XML).with{|file| file.path == font.path}.returns(:parsed_xml)
      font.svg.should == :parsed_xml
    end

    it "memoizes" do
      File.expects(:open).once.returns(:parsed_xml)
      font.svg
      font.svg
    end
  end

  describe "#select" do
    it "finds the first node in the webfont matching any of given CSS selectors" do
      font.stubs(:svg).returns(mock{expects(:at_css).with(:some, :parameters)})
      font.select(:some, :parameters)
    end
  end
end
