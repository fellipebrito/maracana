class ArticlesController < ApplicationController
  before_action :require_login, except: [:show]

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    @article.user_id = current_user.id
    if @article.save
      redirect_to @article
    else
      render :new
    end
  end

  def show
    @article = Article.find(params[:id])
  end

  def edit
    @article = Article.find(params[:id])

    return if @article.user_id == current_user.id

    redirect_to @article, alert: 'You shall not pass'
  end

  def update
    @article = Article.find(params[:id])

    if @article.user_id != current_user.id
      redirect_to @article, alert: 'You shall not pass'
    end

    if @article.update(article_params)
      redirect_to @article
    else
      render 'edit'
    end
  end

  private

  def article_params
    params.require(:article).permit(:title, :content)
  end
end
