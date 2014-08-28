# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Admin::User.create(:email => 'admin@gmail.com', :password => '@12345678', :password_confirmation => '@12345678', :role => 'superadmin', :status => '1')
Admin::Store.create(:s_name => 'Cua hang xyz', :s_description => 'Mo ta cua hang xyz')
Admin::Systemconfig.create(:currency => '0', :rate => '21000', :paypal_account => 'banhg@gmail.com')
Admin::Mymailer.create(:e_title=>"CSKH_KHShop", :e_address=>"smtp.sendgrid.net", :e_port=>"587", :e_domain=>"heroku.com", :e_username=>"app28151738@heroku.com", :e_password=>"rhzzt2do")
Admin::BannerConfig.create(:bn_speed=>"500",:bn_pause=>"5000",:bn_width=>"1168",:bn_random=>"0",:bn_max_large=>"3",:bn_max_small=>"6")
