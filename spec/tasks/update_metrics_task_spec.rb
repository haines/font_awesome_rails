require "spec_helper"

describe UpdateMetricsTask do
  subject(:task) { UpdateMetricsTask.new }

  describe "#font_class" do
    it "returns the source code for FontAwesome::Font" do
      task.expects(:open_file).with("lib/font_awesome/font.rb").returns("source code")
      task.font_class.should == "source code"
    end
  end

  describe "#updated_font_class" do
    it "replaces the ascent and descent constants in FontAwesome::Font" do
      Metrics.stubs(:ascent).returns(1234)
      Metrics.stubs(:descent).returns(-567)
      diff = task.updated_font_class.lines.to_a - task.font_class.lines.to_a
      diff.should have(2).items
      diff.first.should include 'ASCENT = 1234'
      diff.last.should include 'DESCENT = -567'
    end
  end

  describe "#run" do
    it "writes the updated source code" do
      task.stubs(:puts)
      task.stubs(:updated_font_class).returns("updated source code")
      task.expects(:open_file).with("lib/font_awesome/font.rb", "w").yields(mock{
        expects(:write).with("updated source code")
      })
      task.run
    end
  end
end
