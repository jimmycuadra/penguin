require "spec_helper"

describe Penguin::Server, type: :request do
  it "makes CSS accessible via Sprockets" do
    visit "/assets/deck.css"
    page.should have_content(".slide {")
  end
end
