ActiveAdmin.register Genre do
  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :genre_name
  #
  # or
  #
  # permit_params do
  #   permitted = [:genre_name]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end

  index do
    selectable_column
    id_column
    column :genre_name
    actions
  end

  filter :genre_name

  form do |f|
    f.inputs do
      f.input :genre_name
    end
    f.actions
  end
end
