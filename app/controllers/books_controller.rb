class BooksController < ApplicationController
  before_action :set_books, only: %i[show edit update destroy]
  before_action :set_publishers_authors_genres, only: %i[show new edit create update]

  # GET /books or /books.json
  def index
    @books = Book.all
    filter_books_and_sort
  end

  def show
    @book = Book.find(params[:id])

    if current_client.present? && current_client.library_card.present?
      @has_active_borrow = current_client.library_card.borrowed_books.exists?(book_id: @book.id, status: 'Активно')
    else
      @has_active_borrow = false
    end
  end

  # GET /books/new
  def new
    @book = Book.new
  end

  # GET /books/1/edit
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
    @all_authors = Author.all
    @all_genres = Genre.all
  end

  def book_params
    params.require(:book).permit(:book_title, :book_description, :book_rating, :book_popularity, :book_age_rating,
                                 :book_year_of_pub, :publisher_id, :book_amount, :book_image, genre_ids: [], author_ids: [])
  end


  # def filter_books_and_sort
  #     @books = BookQueryService.filter_and_sort_books(params)
  # end

  def filter_books_and_sort
    @books = BookFilterService.new(params).call

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
end
