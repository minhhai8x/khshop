#Precompile for front-end
Rails.application.config.assets.precompile += %w( sanpham.css )
Rails.application.config.assets.precompile += %w( sanpham.js )
Rails.application.config.assets.precompile += %w( sanpham_detail.js )
#Precompile for login
Rails.application.config.assets.precompile += %w( login.css )
Rails.application.config.assets.precompile += %w( login.js )
#Precompile for Admin
Rails.application.config.assets.precompile += %w( admin.css )
Rails.application.config.assets.precompile += %w( admin.js )
#Precompile for Report
Rails.application.config.assets.precompile += %w( report.js )
#Charts
Rails.application.config.assets.precompile += %w( charts.css )
Rails.application.config.assets.precompile += %w( charts.js )