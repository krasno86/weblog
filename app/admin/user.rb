ActiveAdmin.register User do

  index do
    selectable_column
    id_column
    column :email
    column :current_sign_in_at
    column :last_sign_in_at
    actions
  end

  permit_params :comments, :likes

end
