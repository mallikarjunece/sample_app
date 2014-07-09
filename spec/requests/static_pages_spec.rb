require 'spec_helper'
#subject {page}

describe "Static Pages" do
  describe "Home" do
    it "Should have content 'Static Pages'" do
      #visit 'static_pages/home'
      visit root_path
     expect(page).to have_content('Sample App')
    end
    #  it { should have_content('Sample App') }
  end

  describe "Help" do
    it "Should have content 'Mallikarjuna' " do
      #visit 'static_pages/help'
      visit help_path
      expect(page).to have_content('Mallikarjuna')
    end
  end

  describe "About page" do
    it "Should have content 'About Mallikarjuna' " do
       #visit 'static_pages/about'
       visit about_path
       expect(page).to have_content('About Mallikarjuna')
    end
  end
  describe "Contact page" do
    it "Should have 'Contact'" do
       #visit 'static_pages/contact'
       visit contact_path
       expect(page).to have_content("Contact Mallikarjuna")
    end
  end
end
