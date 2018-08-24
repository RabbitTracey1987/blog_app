require 'rails_helper'

RSpec.feature "Adding reviews to Articles" do 
	before do 
		@john = User.create(email:"john@example.com",password:"password")
		@ken = User.create(email:"ken@example.com",password:"password")
		@article=Article.create!(title:"Title one",body:"body of article",user:@john)
	end
	scenario "permits a signed in user to wirte a comment" do
		login_as(@ken)
		visit "/"
		click_link @article.title
		fill_in "New Comment", with: "An amazing article"
		click_button "Add Comment"

		expect(page).to have_content("Comment has been created")
		expect(page).to have_content("An amazing article")
		expect(current_path).to eq(@article.id)
	end
end