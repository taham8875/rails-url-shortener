ActiveAdmin.register View do
  belongs_to :link, finder: :find_by_short_code

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :link_id, :user_agent, :ip_address
  #
  # or
  #
  # permit_params do
  #   permitted = [:link_id, :user_agent, :ip_address]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
end
