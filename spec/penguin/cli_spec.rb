require "spec_helper"

describe Penguin::CLI do
  describe "#start" do
    it "starts up the server" do
      Penguin::Server.should_receive(:run!)
      described_class.start([])
    end
  end

  describe "#new" do
    it "creates a new directory with the given name" do
      described_class.start(["new", "foo"])
      Pathname.new("foo").should be_a_directory
    end

    it "copies the presentation templates into the new directory" do
      pending
    end
  end
end
