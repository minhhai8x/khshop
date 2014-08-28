class UserMailer < ActionMailer::Base
   
  def welcome_email(user,store_info)
    @user = user
    #@url  = orders_path
    @url  = root_url + customers_login_path 
    @store  = store_info
    mail(to: @user.cus_email,subject: "Welcome to "+@store.s_name)
   
  end
  def voucher_email(voucher)
    @vc  = voucher
    mail(to: @vc.to_email,subject: "Voucher tu "+@vc.from_name)
  end
  def mail_setting(store_info,email_config)
    #Config for Action mailer
    ActionMailer::Base.smtp_settings = {
      address: email_config.e_address,
      port: email_config.e_port,
      domain: email_config.e_domain,
      authentication: "plain",
      enable_starttls_auto: true,
      user_name: email_config.e_username,
      password: email_config.e_password
    } 
    ActionMailer::Base.default_options = { from: store_info.s_email}
  end
end