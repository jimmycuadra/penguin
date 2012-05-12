require "spec_helper"
require "pathname"

describe Penguin::CLI do
  def gem_path
    @gem_path ||= Pathname.new(".").realpath
  end

  def tmp_path
    gem_path + "tmp"
  end

  before do
    tmp_path.mkpath
    Dir.chdir(tmp_path)
  end

  after do
    tmp_path.rmtree
    Dir.chdir(gem_path)
  end

  describe "#start" do
    it "starts up the server" do
      Penguin::Server.should_receive(:run!)
      described_class.start([])
    end
  end

  describe "#new" do
    it "creates a new directory with the given name" do
      described_class.start(["new", "foo"])
      (tmp_path + "foo").should be_a_directory
    end

    it "copies the presentation templates into the new directory" do
      pending
    end
  end
end
