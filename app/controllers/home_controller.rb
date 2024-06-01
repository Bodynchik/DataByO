class HomeController < ApplicationController
  def index
    @latest_books = BookQueryService.latest_books
    @top_books = BookQueryService.top_books
    @top_books_by_reviews = BookQueryService.top_books_by_reviews
  end
end
