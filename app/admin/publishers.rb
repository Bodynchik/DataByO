ActiveAdmin.register Publisher do
  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :publisher_name
  #
  # or
  #
  # permit_params do
  #   permitted = [:publisher_name]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end

  index do
    selectable_column
    id_column
    column :publisher_name
  end

  filter :publisher_name

  form do |f|
    f.inputs do
      f.input :publisher_name
    end
    f.actions
  end
end
