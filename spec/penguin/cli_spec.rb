require "spec_helper"

describe Penguin::CLI do
  describe "#start" do
    context "inside a project" do
      before do
        described_class.start(["new", "foo"])
        Dir.chdir("foo")
      end

      after do
        Dir.chdir("..")
      end

      it "starts up the server" do
        Penguin::Server.should_receive(:run!)
        described_class.start(["start"])
      end
    end

    context "outside a project" do
      it "outputs a message telling the user to create a project first" do
        output = capture(:stdout) { described_class.start(["start"]) }
        output.should include("must be inside a project")
      end
    end
  end

  describe "#new" do
    it "creates a new directory with the given name" do
      described_class.start(["new", "foo"])
      Pathname.new("foo").should be_a_directory
    end

    it "copies the presentation templates into the new directory" do
      described_class.start(["new", "foo"])
      ["rb", "haml", "sass", "coffee"].each do |ext|
        Pathname.new("foo/deck.#{ext}").should be_a_file
      end
    end
  end
end
