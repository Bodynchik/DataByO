ActiveAdmin.register BookComment do
  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :book_id, :client_id, :comment_text
  #
  # or
  #
  # permit_params do
  #   permitted = [:book_id, :client_id, :comment_text]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end

  index do
    selectable_column
    id_column
    column :book do |comment|
      "#{comment.book.book_title} (#{comment.book.book_year_of_pub})"
    end
    column :client do |comment|
      "#{comment.client.surname} #{comment.client.name} #{comment.client.midname}"
    end
    column :comment_text
    column :created_at
    actions
  end

  filter :client, as: :select, collection: Client.all.map { |client| ["#{client.surname} #{client.name} #{client.midname}", client.id] }
  filter :book, as: :select, collection: Book.all.map { |book| ["#{book.book_title} (#{book.book_year_of_pub})", book.id] }
  filter :comment_text

  form do |f|
    f.inputs do
      f.input :client, as: :select, collection: Client.all.map { |client| ["#{client.surname} #{client.name} #{client.midname}", client.id] }
      f.input :book, as: :select, collection: Book.all.map { |book| ["#{book.book_title} (#{book.book_year_of_pub})", book.id] }
      f.input :comment_text
    end
    f.actions
  end
end
