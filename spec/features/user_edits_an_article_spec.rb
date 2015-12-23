require 'rails_helper'

feature 'User creates an article with valid data' do
  scenario 'they fill the form, post and sees the article saved' do
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
end
