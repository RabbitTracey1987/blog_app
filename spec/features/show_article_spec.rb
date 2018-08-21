require "rails_helper"

RSpec.feature "Showing an article" do
	before do
		@article=Article.create(title:"this is the first article", body: "there is nothing here")
  end
  scenario "A user view the article" do
  	visit '/'
  	click_link @article.title
  	expect(page).to have_content(@article.title) 
    expect(page).to have_content(@article.body) 
    expect(current_path).to eq(article_path(@article))
  end
end

