require "spec_helper"

describe Penguin::Application, type: :request do
  it "makes slides available at the root path" do
    visit "/"
    page.should have_content("Penguin")
  end

  it "makes CSS accessible via Sprockets" do
    visit "/assets/deck.css"
    page.status_code.should == 200
  end

  it "makes JS accessible via Sprockets" do
    visit "/assets/deck.js"
    page.status_code.should == 200
  end
end
