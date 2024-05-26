ActiveAdmin.register BookAuthor do
  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :author_id, :book_id
  #
  # or
  #
  # permit_params do
  #   permitted = [:author_id, :book_id]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end

  index do
    selectable_column
    id_column
    column :author do |book_author|
      book_author.author.full_name
    end
    column :book do |book_author|
      "#{book_author.book.book_title} (#{book_author.book.book_year_of_pub})"
    end
    actions
  end

  filter :author, as: :select, collection: Author.all.map { |author| [author.full_name, author.id] }
  filter :book, as: :select, collection: Book.all.map { |book| ["#{book.book_title} (#{book.book_year_of_pub})", book.id] }

  form do |f|
    f.inputs do
      f.input :author, as: :select, collection: Author.all.map { |author| [author.full_name, author.id] }
      f.input :book, as: :select, collection: Book.all.map { |book| ["#{book.book_title} (#{book.book_year_of_pub})", book.id] }
    end
    f.actions
  end
end
