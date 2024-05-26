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

ActiveRecord::Schema[7.1].define(version: 20_240_525_212_226) do
  # These are extensions that must be enabled in order to support this database
  enable_extension 'plpgsql'

  create_table 'active_admin_comments', force: :cascade do |t|
    t.string 'namespace'
    t.text 'body'
    t.string 'resource_type'
    t.bigint 'resource_id'
    t.string 'author_type'
    t.bigint 'author_id'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index %w[author_type author_id], name: 'index_active_admin_comments_on_author'
    t.index ['namespace'], name: 'index_active_admin_comments_on_namespace'
    t.index %w[resource_type resource_id], name: 'index_active_admin_comments_on_resource'
  end

  create_table 'admin_users', force: :cascade do |t|
    t.string 'email', default: '', null: false
    t.string 'encrypted_password', default: '', null: false
    t.string 'reset_password_token'
    t.datetime 'reset_password_sent_at'
    t.datetime 'remember_created_at'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['email'], name: 'index_admin_users_on_email', unique: true
    t.index ['reset_password_token'], name: 'index_admin_users_on_reset_password_token', unique: true
  end

  create_table 'authors', force: :cascade do |t|
    t.string 'author_name'
    t.string 'author_surname'
    t.string 'author_midname'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  create_table 'book_authors', force: :cascade do |t|
    t.bigint 'author_id', null: false
    t.bigint 'book_id', null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['author_id'], name: 'index_book_authors_on_author_id'
    t.index ['book_id'], name: 'index_book_authors_on_book_id'
  end

  create_table 'book_genres', force: :cascade do |t|
    t.bigint 'genre_id', null: false
    t.bigint 'book_id', null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['book_id'], name: 'index_book_genres_on_book_id'
    t.index ['genre_id'], name: 'index_book_genres_on_genre_id'
  end

  create_table 'books', force: :cascade do |t|
    t.string 'book_title'
    t.bigint 'publisher_id', null: false
    t.integer 'book_year_of_pub'
    t.string 'isbn'
    t.integer 'book_amount'
    t.integer 'book_age_rating'
    t.float 'book_rating'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['isbn'], name: 'index_books_on_isbn', unique: true
    t.index ['publisher_id'], name: 'index_books_on_publisher_id'
  end

  create_table 'clients', force: :cascade do |t|
    t.string 'name', default: '', null: false
    t.string 'surname', default: '', null: false
    t.string 'midname'
    t.string 'email', default: '', null: false
    t.string 'encrypted_password', default: '', null: false
    t.string 'phone', default: '', null: false
    t.string 'reset_password_token'
    t.datetime 'reset_password_sent_at'
    t.datetime 'remember_created_at'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['email'], name: 'index_clients_on_email', unique: true
    t.index ['phone'], name: 'index_clients_on_phone', unique: true
    t.index ['reset_password_token'], name: 'index_clients_on_reset_password_token', unique: true
  end

  create_table 'genres', force: :cascade do |t|
    t.string 'genre_name'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['genre_name'], name: 'index_genres_on_genre_name', unique: true
  end

  create_table 'publishers', force: :cascade do |t|
    t.string 'publisher_name'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['publisher_name'], name: 'index_publishers_on_publisher_name', unique: true
  end

  add_foreign_key 'book_authors', 'authors'
  add_foreign_key 'book_authors', 'books'
  add_foreign_key 'book_genres', 'books'
  add_foreign_key 'book_genres', 'genres'
  add_foreign_key 'books', 'publishers'
end
