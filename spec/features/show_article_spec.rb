require "rails_helper"

RSpec.feature "Showing an article" do
	before do
    @john=User.create!(email:"john@example.com",password:"password")
    @ken=User.create!(email:"ken@example.com",password:"password")
    @article = Article.create(title: "First Article", body: "Lorem Ipsum",user: @john) 
  end
  scenario "to non signed in user can not view or edit the article" do
  	visit '/'
  	click_link @article.title
  	expect(page).to have_content(@article.title) 
    expect(page).to have_content(@article.body) 
    expect(current_path).to eq(article_path(@article))
    expect(page).not_to have_link("Edit Article")
    expect(page).not_to have_link("Delete Article")
  end
  scenario "to non-owner hide view and edit" do
    login_as(@ken)
    visit '/'
    click_link @article.title
    expect(page).to have_content(@article.title) 
    expect(page).to have_content(@article.body) 
    expect(current_path).to eq(article_path(@article))
    expect(page).not_to have_link("Edit Article")
    expect(page).not_to have_link("Delete Article")
  end
end

