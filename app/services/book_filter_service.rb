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

    selected_genres = parse_param(@params[:genres])

    @books = @books.joins(:genres)
                   .where(genres: { id: selected_genres })
                   .distinct
  end

  def filter_by_publishers
    return if @params[:publishers].blank?

    publisher_ids = parse_param(@params[:publishers])
    @books = @books.where(publisher_id: publisher_ids)
  end

  def filter_by_authors
    return if @params[:authors].blank?

    selected_authors = parse_param(@params[:authors])

    @books = @books.joins(:authors)
                   .where(authors: { id: selected_authors })
                   .distinct
  end

  def filter_by_publish_year
    return if @params[:publish_year].blank?

    year_of_pub = parse_param(@params[:publish_year])
    @books = @books.where(book_year_of_pub: year_of_pub)
  end

  def filter_by_age_rating
    return if @params[:age_rating].blank?

    age_ratings = parse_param(@params[:age_rating])
    @books = @books.where(book_age_rating: age_ratings)
  end

  def limit_books
    limit = @params[:limit].presence || 4
    @books = @books.limit(limit)
  end

  def parse_param(param)
    case param
    when String
      # param.split(',')
    when Array
      param.map { |value| value.match?(/[\+\-]/) ? value : value.to_i }
    else
      []
    end
  end
end
