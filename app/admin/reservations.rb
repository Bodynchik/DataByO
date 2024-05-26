ActiveAdmin.register Reservation do
  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :book_id, :library_card_id, :date_of_reservation, :requested_days, :status
  #
  # or
  #
  # permit_params do
  #   permitted = [:book_id, :library_card_id, :date_of_reservation, :requested_days, :status]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end

  index do
    selectable_column
    id_column
    column :book do |review|
      "#{review.book.book_title} (#{review.book.book_year_of_pub})"
    end
    column :library_card do |review|
      "#{review.library_card.client.surname} #{review.library_card.client.name} #{review.library_card.client.midname}"
    end
    column :date_of_reservation
    column :requested_days
    column :status
    column :created_at
    actions
  end

  filter :library_card, as: :select, collection: LibraryCard.all.map { |library_card|
                                                   ["#{library_card.client.surname} #{library_card.client.name} #{library_card.client.midname}", library_card.id]
                                                 }
  filter :book, as: :select, collection: Book.all.map { |book| ["#{book.book_title} (#{book.book_year_of_pub})", book.id] }
  filter :date_of_reservation
  filter :requested_days
  filter :status

  form do |f|
    f.inputs do
      f.input :library_card, as: :select, collection: LibraryCard.all.map { |library_card|
                                                        ["#{library_card.client.surname} #{library_card.client.name} #{library_card.client.midname}", library_card.id]
                                                      }
      f.input :book, as: :select, collection: Book.all.map { |book| ["#{book.book_title} (#{book.book_year_of_pub})", book.id] }
      f.input :date_of_reservation
      f.input :requested_days
      f.input :status
    end
    f.actions
  end
end
