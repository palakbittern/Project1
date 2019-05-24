ActiveAdmin.register Book do
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
 permit_params :category_id, :book_name, :author_name, :price, :image
#
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
# end
index do
  id_column
  column :book_name
  actions
end

form do |form|

       form.inputs do

       form.input :name, :label => 'Name'

       form.input :category_id, :label => 'category_id', :as => :select, :collection => Category.all.map{|u| ["#{u.name}", u.id]}   

       form.input :author, :label => 'author'
       form.input :price, :label => 'price'
       form.input :image, :label => 'image', as: :file
       # form.input :user_id, :label => 'user_id', :as => :select, :collection => User.all.map{|u| ["#{u.first_name}", u.id]} 
       #<%= form.submit %>
       end
           form.actions
   
       end
end

