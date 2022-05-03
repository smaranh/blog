class BackfillStatusToExistingArticles < ActiveRecord::Migration[7.0]
  disable_ddl_transaction!

  articles = Article.all
  articles.each do |article|
    article.status = 'public'
    article.save
    sleep(0.01) #throttle
  end
end
