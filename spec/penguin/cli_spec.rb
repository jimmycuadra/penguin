require "spec_helper"

describe Penguin::CLI do
  describe "#start" do
    it "starts up the server" do
      Penguin::Server.should_receive(:run!)
      described_class.start([])
    end
  end
end
