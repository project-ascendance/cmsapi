class NewsArticlesController < ApplicationController
  before_action :set_news_article, only: %i[ show update destroy ]
  before_action :set_api_hostname

  # GET /news_articles
  def index
    if params[:range] =~ /-/
      rangeSplit = params[:range].split(/-/,2)
      startRange = rangeSplit[0].to_i
      endRange = rangeSplit[1].to_i
      @news_articles = NewsArticle.all.order(:title,startDate: :desc).slice(startRange,endRange-startRange)
    else
      @news_articles = NewsArticle.all.order(:title,startDate: :desc)
    end
    render json: @news_articles
  end

  # GET /news_articles/1
  def show
    render json: @news_article
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_news_article
      @news_article = NewsArticle.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def news_article_params
      params.require(:news_article).permit(:title, :body, :startDate, :endDate)
    end

  def set_api_hostname
    @hostname = 'https://aggregator/news'
  end

  def get_external_news
    local_news = NewsArticle.all.order(:title,startDate: :desc).first
    # Http request to get news.
    request = httpx.get(@hostname+'?type=news&date=#{local_news[:startDate]}')
    news_json = JSON.parse(request, :symbolize_names => true)
    # Iterate through news and save those news who are new.
    # TBD!
  end
end
