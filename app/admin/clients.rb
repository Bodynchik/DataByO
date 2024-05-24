ActiveAdmin.register Client do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :name, :surname, :midname, :email, :encrypted_password, :phone, :reset_password_token, :reset_password_sent_at, :remember_created_at, :password
  #
  # or
  #
  # permit_params do
  #   permitted = [:name, :surname, :midname, :email, :encrypted_password, :phone, :reset_password_token, :reset_password_sent_at, :remember_created_at]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end

  index do
    selectable_column
    id_column
    column :name
    column :surname
    column :midname
    column :phone
    column :email
    column :created_at
    actions
  end

  filter :name
  filter :surname
  filter :midname
  filter :phone
  filter :email
  filter :created_at

  form do |f|
    f.inputs do
      f.input :name
      f.input :surname
      f.input :midname
      f.input :phone
      f.input :email
      f.input :password
    end
    f.actions
  end
end
