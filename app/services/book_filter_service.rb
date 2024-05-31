class BookFilterService
  def initialize(params)
    @params = params
    @books = Book.all
  end

  def call
    filter_by_genres
    filter_by_publishers
    filter_by_authors
    filter_by_publish_year
    filter_by_age_rating
    @books
  end

  private

  def filter_by_genres
    return if @params[:genres].blank?

    selected_genres = @params[:genres].split(',').map(&:to_i)
    placeholders = selected_genres.map { '?' }.join(', ')
    query = <<-SQL.squish
        SELECT book_id
        FROM book_genres
        WHERE genre_id IN (#{placeholders})
        GROUP BY book_id
        HAVING COUNT(DISTINCT genre_id) = ?
    SQL

    book_ids = ActiveRecord::Base.connection.execute(ActiveRecord::Base.send(:sanitize_sql_array, [query, *selected_genres, selected_genres.length])).pluck('book_id')
    @books = @books.where(id: book_ids)
  end

  def filter_by_publishers
    @books = @books.where(publisher_id: @params[:publishers]) if @params[:publishers].present?
  end

  def filter_by_authors
    return if @params[:authors].blank?

    selected_authors = @params[:authors].split(',')
    placeholders = selected_authors.map { '?' }.join(',')
    authors_count = selected_authors.length

    sql = <<-SQL.squish
        SELECT book_id
        FROM book_authors
        WHERE author_id IN (#{placeholders})
        GROUP BY book_id
        HAVING COUNT(DISTINCT author_id) = ?
    SQL

    book_ids = BookAuthor.find_by_sql([sql, *selected_authors, authors_count]).map(&:book_id)
    @books = @books.where(id: book_ids)
  end

  def filter_by_publish_year
    @books = @books.where(book_year_of_pub: @params[:publish_year]) if @params[:publish_year].present?
  end

  def filter_by_age_rating
    @books = @books.where(book_age_rating: @params[:age_rating]) if @params[:age_rating].present?
  end
end
