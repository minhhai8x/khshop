class Admin::Banner < ActiveRecord::Base
   #config for carrierwave
   mount_uploader :lg_imageurl, AvatarUploader
   
end
