require "spec_helper"

describe Penguin::Server, type: :request do
  it "loads the user config" do
    Object.const_defined?(:Haml).should be_true
  end

  it "mounts Sprockets at /css" do
    visit "/assets/deck.css"
    page.should have_content(".slide {")
  end
end
