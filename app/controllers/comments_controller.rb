class CommentsController < ApplicationController
  def create
    @commentable = find_commentable
    @comment = @commentable.comments.build(comment_params)
  end

  private

  def find_commentable
    params.each do |name, value|
      return Regexp.last_match(1)
        .classify
        .constantize
        .find(value) if name =~ /(.+)_id$/
    end
    nil
  end
end
