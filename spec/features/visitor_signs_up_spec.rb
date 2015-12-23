require 'rails_helper'

feature 'Visitor signs up' do
  scenario 'with valid email and password' do
    sign_up_with email: 'valid@example.com', password: 'password'

    expect(page).to have_selector(:link_or_button, 'Sign out')
  end

  scenario 'with invalid email' do
    sign_up_with email: 'invalid_email', password: 'password'

    expect(page).to have_content('Sign in')
  end

  scenario 'with blank password' do
    sign_up_with email: 'valid@example.com', password: ''

    expect(page).to have_content('Sign in')
  end
end
