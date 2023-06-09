ActiveAdmin.register Customer, as: 'AdminCustomer' do

  permit_params do
    permitted = [:name, :status, :email, :encrypted_password, :reset_password_token, :reset_password_sent_at, :remember_created_at]
    permitted << :other if params[:action] == 'create' && current_user.admin?
    permitted
  end

  index do
    # インデックスページのカスタマイズ
    column :name
    column :email
    actions
  end

  show do
    # 詳細ページのカスタマイズ
    attributes_table do
      row :name
      row :email
      # 他の属性
    end
  end

  form do |f|
    # 編集フォームのカスタマイズ
    inputs 'Customer' do
      input :name
      input :email
      # 他の属性
    end
    actions
  end
end
