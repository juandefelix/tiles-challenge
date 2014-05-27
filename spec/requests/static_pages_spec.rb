require 'spec_helper'

describe "StaticPages" do
  subject { page }

  describe "Home Page" do
    before { visit root_path }

    it { should have_title(full_title(""))}
    it { should_not have_title(full_title("Home"))}
    it { should have_content('Tiles Challenge - Click on the tiles until all of them dissapear. Then you will see the most clicked names') }
    (0..63).each do |n|
      it { should have_selector("div##{n}")}
    end
  end

  
end
