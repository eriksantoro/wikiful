class WelcomeController < ApplicationController
  def index
  	@recent_articles = Article.order(created_at: :desc).limit(5)
  end
end

#Method also equal to @recent_articles = Article.all.order(created_at: :desc).limit(5), except this doesn't put in order of most recent to least recent