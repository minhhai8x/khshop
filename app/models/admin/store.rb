class Admin::Store < ActiveRecord::Base
  #config for carrierwave
   mount_uploader :s_logo, AvatarUploader
end
