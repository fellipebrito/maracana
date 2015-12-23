require 'rails_helper'

feature 'User creates an article with valid data' do
  scenario 'they fill the form, post and sees the article saved' do
    sign_up_with email: 'lucky@skywalker.com', password: 'password'
    submit_article title: 'The force awakens', content: 'May the 4th be with u'

    expect(page).to have_text('The force awakens')
    expect(page).to have_text('by lucky@skywalker.com')
    expect(page).to have_text('May the 4th be with u')
    expect(page).to have_link('Edit')
  end

  scenario 'they do not fill the required fields and see an alert' do
    sign_up_with email: 'lucky@skywalker.com', password: 'password'
    submit_article title: 'The force awakens', content: ''

    expect(page).to have_text("can't be blank")
  end

  scenario 'user is not logged in and is redirected' do
    visit new_article_path

    expect(page).to have_text('Please sign in to continue')
  end
end
