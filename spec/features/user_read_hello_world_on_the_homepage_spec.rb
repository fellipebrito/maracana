require 'rails_helper'

feature 'User visits homepage' do
  scenario 'they see Hello World on the page' do
    visit root_path

    expect(page).to have_text('Hello World')
  end
end
