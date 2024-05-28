# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.1].define(version: 2024_05_28_161926) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_admin_comments", force: :cascade do |t|
    t.string "namespace"
    t.text "body"
    t.string "resource_type"
    t.bigint "resource_id"
    t.string "author_type"
    t.bigint "author_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["author_type", "author_id"], name: "index_active_admin_comments_on_author"
    t.index ["namespace"], name: "index_active_admin_comments_on_namespace"
    t.index ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource"
  end

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum"
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  # rubocop:disable Rails/CreateTableWithTimestamps
  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end
  # rubocop:enable Rails/CreateTableWithTimestamps

  create_table "admin_users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_admin_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true
  end

  create_table "authors", force: :cascade do |t|
    t.string "author_name"
    t.string "author_surname"
    t.string "author_midname"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "book_authors", force: :cascade do |t|
    t.bigint "author_id", null: false
    t.bigint "book_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["author_id"], name: "index_book_authors_on_author_id"
    t.index ["book_id"], name: "index_book_authors_on_book_id"
  end

  create_table "book_comments", force: :cascade do |t|
    t.bigint "book_id", null: false
    t.bigint "client_id", null: false
    t.string "comment_text"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["book_id"], name: "index_book_comments_on_book_id"
    t.index ["client_id"], name: "index_book_comments_on_client_id"
  end

  create_table "book_genres", force: :cascade do |t|
    t.bigint "genre_id", null: false
    t.bigint "book_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["book_id"], name: "index_book_genres_on_book_id"
    t.index ["genre_id"], name: "index_book_genres_on_genre_id"
  end

  create_table "book_raitings", force: :cascade do |t|
    t.bigint "book_id", null: false
    t.bigint "client_id", null: false
    t.float "rating_value"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["book_id"], name: "index_book_raitings_on_book_id"
    t.index ["client_id"], name: "index_book_raitings_on_client_id"
  end

  create_table "book_reviews", force: :cascade do |t|
    t.bigint "book_id", null: false
    t.bigint "library_card_id", null: false
    t.string "review_text"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["book_id"], name: "index_book_reviews_on_book_id"
    t.index ["library_card_id"], name: "index_book_reviews_on_library_card_id"
  end

  create_table "books", force: :cascade do |t|
    t.string "book_title"
    t.bigint "publisher_id", null: false
    t.integer "book_year_of_pub"
    t.string "isbn"
    t.integer "book_amount"
    t.string "book_age_rating"
    t.float "book_rating"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "description"
    t.index ["isbn"], name: "index_books_on_isbn", unique: true
    t.index ["publisher_id"], name: "index_books_on_publisher_id"
  end

  create_table "borrowed_books", force: :cascade do |t|
    t.bigint "book_id", null: false
    t.bigint "library_card_id", null: false
    t.date "date_borrowed"
    t.date "date_due"
    t.string "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["book_id"], name: "index_borrowed_books_on_book_id"
    t.index ["library_card_id"], name: "index_borrowed_books_on_library_card_id"
  end

  create_table "clients", force: :cascade do |t|
    t.string "name", default: "", null: false
    t.string "surname", default: "", null: false
    t.string "midname"
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "phone", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_clients_on_email", unique: true
    t.index ["phone"], name: "index_clients_on_phone", unique: true
    t.index ["reset_password_token"], name: "index_clients_on_reset_password_token", unique: true
  end

  create_table "genres", force: :cascade do |t|
    t.string "genre_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["genre_name"], name: "index_genres_on_genre_name", unique: true
  end

  create_table "library_cards", force: :cascade do |t|
    t.bigint "client_id", null: false
    t.integer "max_reserve_allowed"
    t.integer "max_borrow_allowed"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["client_id"], name: "index_library_cards_on_client_id"
  end

  create_table "publishers", force: :cascade do |t|
    t.string "publisher_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["publisher_name"], name: "index_publishers_on_publisher_name", unique: true
  end

  create_table "reservations", force: :cascade do |t|
    t.bigint "book_id", null: false
    t.bigint "library_card_id", null: false
    t.date "date_of_reservation"
    t.integer "requested_days"
    t.string "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["book_id"], name: "index_reservations_on_book_id"
    t.index ["library_card_id"], name: "index_reservations_on_library_card_id"
  end

  create_table "returns", force: :cascade do |t|
    t.bigint "book_id", null: false
    t.bigint "library_card_id", null: false
    t.date "date_of_return"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["book_id"], name: "index_returns_on_book_id"
    t.index ["library_card_id"], name: "index_returns_on_library_card_id"
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "book_authors", "authors"
  add_foreign_key "book_authors", "books"
  add_foreign_key "book_comments", "books"
  add_foreign_key "book_comments", "clients"
  add_foreign_key "book_genres", "books"
  add_foreign_key "book_genres", "genres"
  add_foreign_key "book_raitings", "books"
  add_foreign_key "book_raitings", "clients"
  add_foreign_key "book_reviews", "books"
  add_foreign_key "book_reviews", "library_cards"
  add_foreign_key "books", "publishers"
  add_foreign_key "borrowed_books", "books"
  add_foreign_key "borrowed_books", "library_cards"
  add_foreign_key "library_cards", "clients"
  add_foreign_key "reservations", "books"
  add_foreign_key "reservations", "library_cards"
  add_foreign_key "returns", "books"
  add_foreign_key "returns", "library_cards"
end
