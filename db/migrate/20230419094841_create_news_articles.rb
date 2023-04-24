class CreateNewsArticles < ActiveRecord::Migration[7.0]
  def change
    create_table :news_articles do |t|
      t.string :title
      t.text :body
      t.date :startDate
      t.date :endDate

      t.timestamps
    end
  end
end
