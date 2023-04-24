class AddDetailsToNewsArticles1 < ActiveRecord::Migration[7.0]
  def change
    change_column_null(:news_articles,:endDate,true)
  end
end
