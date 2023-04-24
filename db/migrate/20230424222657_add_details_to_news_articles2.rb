class AddDetailsToNewsArticles2 < ActiveRecord::Migration[7.0]
  def change
    add_reference :news_articles, :image, null: true, foreign_key: true
  end
end
