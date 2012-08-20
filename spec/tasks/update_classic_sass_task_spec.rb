require "spec_helper"

describe UpdateClassicSassTask do
  subject(:task) { UpdateClassicSassTask.new }

  describe "#contents" do
    it "returns the Font Awesome scss" do
      task.expects(:open_file).with("Font-Awesome/sass/font-awesome.scss").returns("scss code")
      task.contents.should == "scss code"
    end
  end

  describe "#styles" do
    it "returns the Font Awesome styles excluding the @font-face declaration" do
      contents = task.contents.lines.to_a
      styles = task.styles.lines.to_a

      styles.first.should == "/*  Font Awesome styles\n"
      styles.should == contents.last(styles.length)
    end
  end

  describe "#run" do
    it "copies classic Font Awesome styles" do
      task.stubs(:puts)
      task.stubs(:styles).returns("classic styles")
      task.expects(:open_file).with("vendor/assets/stylesheets/font-awesome/_classic.scss", "w").yields(mock{
        expects(:write).with("classic styles")
      })
      task.run
    end
  end
end
