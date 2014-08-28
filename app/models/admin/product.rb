class Admin::Product < ActiveRecord::Base
  
  #order product list by name
  #default_scope{ order('name')}
   
   #config for carrierwave
   mount_uploader :image, AvatarUploader
   
   #config for kaminari
   #paginates_per system_config.number_category.to_i
   
   #search 
   def self.search(mkeyword)
    search_condition = "%" + mkeyword + "%"
    where('name LIKE ? OR meta_keyword LIKE ?', search_condition, search_condition.downcase.tr(' ', '-'))
   end
end
