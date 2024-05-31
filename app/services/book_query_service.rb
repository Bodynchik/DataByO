class BookQueryService
  def self.latest_books(limit = 4)
    Book.order(created_at: :desc).limit(limit)
  end

  def self.top_books(limit = 4)
    Book.select('books.*, COALESCE(book_rating, 0) AS normalized_rating')
        .order('normalized_rating DESC')
        .limit(limit)
  end

  def self.top_books_by_reviews(limit = 4)
    Book.joins('LEFT JOIN book_reviews ON books.id = book_reviews.book_id')
        .select('books.*, COUNT(book_reviews.id) AS reviews_count')
        .group('books.id')
        .order('reviews_count DESC')
        .limit(limit)
  end

  def self.filter_and_sort_books(params)
    books = BookFilterService.new(params).call

    return books unless params[:sort]

    sort_column = case params[:sort]
                  when 'book_rating'
                    'book_rating'
                  when 'book_popularity'
                    Arel.sql('(SELECT COUNT(*) FROM book_reviews WHERE book_reviews.book_id = books.id)')
                  else
                    params[:sort] || 'created_at'
                  end

    sort_direction = params[:direction] || 'asc'
    books.order(sort_column => sort_direction)
  end
end
