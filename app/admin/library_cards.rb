ActiveAdmin.register LibraryCard do
  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :client_id, :max_reserve_allowed, :max_borrow_allowed
  #
  # or
  #
  # permit_params do
  #   permitted = [:client_id, :max_reserve_allowed, :max_borrow_allowed]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end

  index do
    selectable_column
    id_column
    column :client do |card|
      "#{card.client.surname} #{card.client.name} #{card.client.midname}"
    end
    column :max_reserve_allowed
    column :max_borrow_allowed
    column :created_at
    actions
  end

  filter :client, as: :select, collection: Client.all.map { |client| ["#{client.surname} #{client.name} #{client.midname}", client.id] }
  filter :max_reserve_allowed
  filter :max_borrow_allowed

  form do |f|
    f.inputs do
      f.input :client, as: :select, collection: Client.all.map { |client| ["#{client.surname} #{client.name} #{client.midname}", client.id] }
      f.input :max_reserve_allowed
      f.input :max_borrow_allowed
    end
    f.actions
  end
end
