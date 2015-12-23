module Features
  module ArticleHelpers
    def submit_article(title:, content:)
      visit new_article_path
      fill_in 'Title',   with: title
      fill_in 'Content', with: content
      click_on 'Save it!'
    end
  end
end
