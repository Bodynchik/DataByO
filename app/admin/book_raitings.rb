ActiveAdmin.register BookRaiting do
  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :book_id, :client_id, :rating_value
  #
  # or
  #
  # permit_params do
  #   permitted = [:book_id, :client_id, :rating_value]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end

  index do
    selectable_column
    id_column
    column :book do |rating|
      "#{rating.book.book_title} (#{rating.book.book_year_of_pub})"
    end
    column :client do |rating|
      "#{rating.client.surname} #{rating.client.name} #{rating.client.midname}"
    end
    column :rating_value
    column :created_at
    actions
  end

  filter :client, as: :select, collection: Client.all.map { |client| ["#{client.surname} #{client.name} #{client.midname}", client.id] }
  filter :book, as: :select, collection: Book.all.map { |book| ["#{book.book_title} (#{book.book_year_of_pub})", book.id] }
  filter :rating_value

  form do |f|
    f.inputs do
      f.input :client, as: :select, collection: Client.all.map { |client| ["#{client.surname} #{client.name} #{client.midname}", client.id] }
      f.input :book, as: :select, collection: Book.all.map { |book| ["#{book.book_title} (#{book.book_year_of_pub})", book.id] }
      f.input :rating_value
    end
    f.actions
  end
end
