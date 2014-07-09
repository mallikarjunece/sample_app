require 'spec_helper'

describe "Users Controller " do
	describe "Sign Up page" do
		it "Should have content 'Find me in' " do
			visit signup_path
			expect(page).to have_content('Find me in')
		end
	end
end

