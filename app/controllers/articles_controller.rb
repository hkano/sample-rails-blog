class ArticlesController < ApplicationController

  impressionist actions: [:show]

  before_action :set_article, only: [:show, :edit, :update, :destroy]

  def index
    @articles = Article.published.all
  end

  def show
    redirect_to articles_path unless @article.published?
  end

  def new
  end

  def create
    @article = Article.new article_params
    begin
      @article.save!
    rescue ActiveRecord::RecordInvalid
      render :new and return
    end
    notify_slack(@article)
    redirect_to @article
  end


  def edit
  end


  def update
    begin
      @article.update! article_params
    rescue ActiveRecord::RecordInvalid
      render :edit and return
    end
    redirect_to @article
  end

  def destroy
    @article.destroy!
    redirect_to articles_path
  end

  private

  def article_params
    params.require(:article).permit(:title, :text, :published_at)
  end

  def set_article
    @article = Article.find params[:id]
  end

  def notify_slack(article)
    SlackNotifier::notify("New article: id => #{article.id} / title => #{article.title}")
  end

end
