require 'spec_helper'

describe "Ten most clicked page" do
  subject { page }

  before { visit tiles_path }
    

  describe "should have the expected elements" do
    it { should have_selector "ul" }
    it { should have_css("li", :maximum => 10) }
    it { should have_css("a", :text => "Back to Tiles") }
  end

  describe "redirect to the tiles page on click" do
    before { click_link "Back to Tiles" }

    it { should have_title(full_title("")) }
  end
end
