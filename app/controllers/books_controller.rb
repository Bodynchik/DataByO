class BooksController < ApplicationController
  before_action :set_books, only: %i[show edit update destroy]
  before_action :set_publishers_authors_genres, only: %i[show new edit create update]

  # GET /books or /books.json
  def index
    @books = Book.page(params[:page]).per(9)
    load_filter_options
    filter_books_and_sort
  end

  # GET /books/1 or /books/1.json
  def show
    @book = Book.find(params[:id])

    @has_active_borrow = if current_client.present? && current_client.library_card.present?
                           current_client.library_card.borrowed_books.exists?(book_id: @book.id, status: 'Активно')
                         else
                           false
                         end
  end

  def new
    @book = Book.new
  end

  def edit; end

  # POST /books or /books.json
  def create
    @book = Book.new(book_params)
    @book.authors = Author.where(id: params[:book][:author_ids])
    @book.genres = Genre.where(id: params[:book][:genre_ids])

    respond_to do |format|
      if @book.save
        format.html { redirect_to book_url(@book), notice: 'Book was successfully created.' }
        format.json { render :show, status: :created, location: @book }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @book.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /books/1 or /books/1.json
  def update
    respond_to do |format|
      if @book.update(book_params)
        @book.authors = Author.where(id: params[:book][:author_ids])
        @book.genres = Genre.where(id: params[:book][:genre_ids])

        format.html { redirect_to book_url(@book), notice: 'Book was successfully updated.' }
        format.json { render :show, status: :ok, location: @book }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @book.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /books/1 or /books/1.json
  def destroy
    @book.destroy!

    respond_to do |format|
      format.html { redirect_to books_url, notice: 'Book was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_books
    @book = Book.find(params[:id])
  end

  def set_publishers_authors_genres
    @publishers = Publisher.all
    @authors = Author.all
    @genres = Genre.all
  end

  def book_params
    params.require(:book).permit(:book_title, :book_description, :book_rating, :book_popularity, :book_age_rating,
                                 :book_year_of_pub, :publisher_id, :book_amount, :book_image, genre_ids: [], author_ids: [])
  end

  def filter_books_and_sort
    @books = Book.all
    @books = filter_books


    return unless params[:sort]

    sort_column = case params[:sort]
                  when 'book_rating'
                    'book_rating'
                  when 'book_popularity'
                    Arel.sql('(SELECT COUNT(*) FROM book_reviews WHERE book_reviews.book_id = books.id)')
                  else
                    params[:sort] || 'created_at'
                  end

    sort_direction = params[:direction] || 'asc'
    @books = @books.order(sort_column => sort_direction)
  end

  def load_filter_options
    @genres = Genre.all
    @publishers = Publisher.all
    @authors = Author.all
    @publish_years = Book.distinct.pluck(:book_year_of_pub)
    @age_ratings = Book.distinct.pluck(:book_age_rating)
  end

  def filter_books
    if params[:genres].present?
      selected_genres = params[:genres].split(',').map(&:to_i)
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

      Rails.logger.debug(params[:genres])
      Rails.logger.debug(@books)
    end

    @books = @books.where(publisher_id: params[:publishers]) if params[:publishers].present?

    if params[:authors].present?
      selected_authors = params[:authors].split(',')
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
      @books = Book.where(id: book_ids)
    end

    @books = @books.where(book_year_of_pub: params[:publish_year]) if params[:publish_year].present?

    @books = @books.where(book_age_rating: params[:age_rating]) if params[:age_rating].present?

    @books
  end
end
