require "rails_helper"

RSpec.feature "listing articles" do 
	before do	
    @article1=Article.create(title: "1st article", body:"Harry Poter")
    @article2=Article.create(title: "2nd article", body:"Hello Kitty")
	end
	scenario "A user lists all articles" do 
		visit "/"
		expect(page).to have_content(@article1.title)
		expect(page).to have_content(@article1.body)
		expect(page).to have_content(@article2.title)
		expect(page).to have_content(@article2.body)
		expect(page).to have_link(@article1.title)
		expect(page).to have_link(@article2.title)
	end

end