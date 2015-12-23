require 'rails_helper'

feature 'User creates an article with valid data and edits it' do
  scenario 'once they have a saved article they update it' do
    sign_up_with email: 'valid@example.com', password: 'password'
    submit_article title: 'The force awakens', content: 'May the 4th be with u'
    click_link('Edit Article')
    fill_in 'Title', with: 'The force sleeps'
    fill_in 'Content', with: 'May the sleepiness be with you'
    click_on 'Save it!'

    expect(page).to have_text('The force sleeps')
    expect(page).to have_text('May the sleepiness be with you')
    expect(page).to have_link('Edit')
  end

  scenario 'user is denied to edit an article that does not belong to him' do
    sign_up_with email: 'valid@example.com', password: 'password'
    article = create(:article)
    visit edit_article_path(article)

    expect(page).to have_text('You shall not pass')
  end
end
