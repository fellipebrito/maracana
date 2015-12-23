require 'rails_helper'

feature 'User creates an image with valid data' do
  scenario 'they fill the form, post and sees the image saved' do
    submit_image title: 'Death Star', filepath: 'image.jpg'

    expect(page).to have_text('Death Star')
  end

  scenario 'they fill the form, post and sees the image saved' do
    submit_image title: 'Death Star', filepath: ''

    expect(page).to have_text("can't be blank")
  end

  def submit_image(title:, filepath:)
    visit new_image_path
    fill_in 'Title', with: title
    fill_in 'File', with: filepath
    click_on 'Save it!'
  end
end
