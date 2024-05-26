ActiveAdmin.register Author do
  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  # permit_params :author_name, :author_surname, :author_midname
  #
  # or
  #
  # permit_params do
  #   permitted = [:author_name, :author_surname, :author_midname]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
end
