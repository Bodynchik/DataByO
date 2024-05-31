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

    @books = @books.joins(:genres)
                   .where(genres: { id: selected_genres })
                   .distinct
  end

  def filter_by_publishers
    return unless @params[:publishers].present?
      publisher_ids = @params[:publishers].split(',').map(&:to_i)
      @books = @books.where(publisher_id: publisher_ids)
  end

  def filter_by_authors
    return if @params[:authors].blank?

    selected_authors = @params[:authors].split(',').map(&:to_i)

    @books = @books.joins(:authors)
                   .where(authors: { id: selected_authors })
                   .distinct
  end

  def filter_by_publish_year
    return unless @params[:publish_year].present?
      year_of_pub = @params[:publish_year].split(',').map(&:to_i)
      @books = @books.where(book_year_of_pub: year_of_pub)
  end


  def filter_by_age_rating
    return unless @params[:age_rating].present?
      age_ratings = @params[:age_rating].split(',')
      @books = @books.where(book_age_rating: age_ratings)
  end

  def limit_books
    limit = @params[:limit].presence || 4
    @books = @books.limit(limit)
  end
end
