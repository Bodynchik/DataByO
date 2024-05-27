ActiveAdmin.register Book do
  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :book_title, :publisher_id, :book_year_of_pub, :isbn, :book_amount, :book_age_rating, :book_rating,
                :description, author_ids: [], genre_ids: []
  #
  # or
  #
  # permit_params do
  #   permitted = [:book_title, :publisher_id, :book_year_of_pub, :isbn, :book_amount, :book_age_rating, :book_rating]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end

  index do
    selectable_column
    id_column
    column :book_title
    column :publisher do |book|
      book.publisher.publisher_name
    end
    column :authors do |book|
      book.authors.map(&:full_name).join(', ')
    end
    column :genres do |book|
      book.genres.map(&:genre_name).join(', ')
    end
    column :book_year_of_pub
    column :isbn
    column :book_amount
    column :book_age_rating
    column :book_rating
    actions
  end

  filter :book_title
  filter :publisher, as: :select, collection: Publisher.all.map { |publisher| [publisher.publisher_name, publisher.id] }
  filter :authors, as: :select, collection: Author.all.map { |author| [author.full_name, author.id] }
  filter :genres, as: :select, collection: Genre.all.map { |genre| [genre.genre_name, genre.id] }
  filter :book_year_of_pub
  filter :isbn
  filter :book_amount
  filter :book_age_rating
  filter :book_rating

  form do |f|
    f.inputs do
      f.input :book_title
      f.input :publisher, as: :select, collection: Publisher.all.map { |publisher| [publisher.publisher_name, publisher.id] }
      f.input :authors, as: :select, collection: Author.all.map { |author| [author.full_name, author.id] }, input_html: { multiple: true }
      f.input :genres, as: :select, collection: Genre.all.map { |genre| [genre.genre_name, genre.id] }, input_html: { multiple: true }
      f.input :book_year_of_pub, as: :select, collection: (1900..Time.zone.today.year).to_a
      f.input :isbn
      f.input :book_amount
      f.input :book_age_rating
      f.input :description
    end
    f.actions
  end
end
