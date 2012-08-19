require "spec_helper"

describe UpdateHexCodesTask do
  subject(:task) { UpdateHexCodesTask.new }

  describe "#hex_code_class" do
    it "returns the source code for FontAwesome::HexCode" do
      task.expects(:open_file).with("lib/font_awesome/hex_code.rb").yields(mock{expects(:read)}).returns("source code")
      task.hex_code_class.should == "source code"
    end
  end

  describe "#css" do
    it "returns the Font Awesome css styles" do
      task.expects(:open_file).with("Font-Awesome/css/font-awesome.css").yields(mock{expects(:read)}).returns("css rules")
      task.css.should == "css rules"
    end
  end

  describe "#hex_codes" do
    it "extracts the hex code lookup table from the css" do
      task.hex_codes.should have_at_least(200).keys
      task.hex_codes["glass"].should == "f000"
    end
  end

  describe "#updated_hex_code_class" do
    it "replaces the hex code lookup table in FontAwesome::HexCode" do
      task.stubs(:hex_codes).returns({"pizza" => "f00d", "linux" => "f055"})
      diff = task.updated_hex_code_class.lines.to_a - task.hex_code_class.lines.to_a
      diff.should have(1).item
      diff.first.should include 'HEX_CODES = {"pizza"=>"f00d", "linux"=>"f055"}'
    end
  end

  describe "#run" do
    it "writes the updated source code" do
      task.stubs(:puts)
      task.stubs(:updated_hex_code_class).returns("updated source code")
      task.expects(:open_file).with("lib/font_awesome/hex_code.rb", "w").yields(mock{expects(:write).with("updated source code")})
      task.run
    end
  end
end
