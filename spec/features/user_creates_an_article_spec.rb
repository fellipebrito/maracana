require 'rails_helper'

feature 'User creates an article with valid data' do
  scenario 'they fill the form, post and sees the article saved' do
    submit_article title: 'The force awakens', content: 'May the 4th be with u'

    expect(page).to have_text('The force awakens')
    expect(page).to have_text('May the 4th be with u')
  end

  scenario 'they fill the form, post and sees the article saved' do
    submit_article title: 'The force awakens', content: ''

    expect(page).to have_text("can't be blank")
  end

  def submit_article(title:, content:)
    visit new_article_path
    fill_in 'Title',   with: title
    fill_in 'Content', with: content
    click_on 'Save it!'
  end
end
