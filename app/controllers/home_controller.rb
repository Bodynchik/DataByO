class HomeController < ApplicationController
  def index
    @latest_books = Book.order(created_at: :desc).limit(4)
  end
end
