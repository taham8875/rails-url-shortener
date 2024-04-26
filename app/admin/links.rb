ActiveAdmin.register Link do
  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment

  permit_params :original_url, :short_code, :title, :description, :image, :views_count, :user_id

  #
  # or
  #
  # permit_params do
  #   permitted = [:original_url, :short_code, :title, :description, :image, :views_count, :user_id]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end

  # index do
  #   Link.column_names.each do |column_name|
  #     column column_name.to_sym
  #   end

  #   column :views_count

  #   actions
  # end

  controller do
    def find_resource
      scoped_collection.where(short_code: params[:id]).first!
    end
  end

  index do
    selectable_column
    column :id do |link|
      link_to "#{link.id}", "links/#{link.short_code}", priority: 1
    end
    columns_to_exclude = ["id"]
    (Link.column_names - columns_to_exclude).each do |column_name|
      column column_name.to_sym
    end
    actions
  end
end
