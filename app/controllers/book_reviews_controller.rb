class BookReviewsController < ApplicationController
  before_action :set_book_reviews, only: %i[show edit update destroy]

  # GET /books or /books.json
  def index
    @books = BookReview.all
  end

  # GET /books/1 or /books/1.json
  def show
    @book = BookReview.find(params[:id])
  end

  # GET /books/new
  def new
    @book = BookReview.new
  end

  # GET /books/1/edit
  def edit; end

  # POST /books or /books.json
  def create
    @book_review = BookReview.new(book_review_params)

    respond_to do |format|
      if @book_review.save
        format.html { redirect_back(fallback_location: clients_profile_path) }
        format.json { render :show, status: :created, location: @book_review }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @book_review.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /books/1 or /books/1.json
  def update
    respond_to do |format|
      if @book_review.update(book_review_params)

        format.html { redirect_to book_review_url(@book_review), notice: 'BookReview was successfully updated.' }
        format.json { render :show, status: :ok, location: @book_review }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @book_review.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /books/1 or /books/1.json
  def destroy
    @book_review.destroy!

    respond_to do |format|
      format.html { redirect_to book_reviews_url, notice: 'BookReview was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_book_reviews
    @book_review = BookReview.find(params[:id])
  end

  def book_review_params
    params.require(:book_review).permit(:book_id, :library_card_id, :review_text, :rating_value)
  end
end
