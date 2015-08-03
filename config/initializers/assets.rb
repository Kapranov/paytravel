Rails.application.config.assets.version = '1.0'

# Add additional assets to the asset load path
# Rails.application.config.assets.paths << Emoji.images_path

Rails.application.config.assets.precompile += %w( .svg .eot .woff .ttf )
Rails.application.config.assets.precompile += %w( bootstrap.min.js bootstrap.min.css )
Rails.application.config.assets.precompile += %w( animate/animate.css )
Rails.application.config.assets.precompile += %w( error.js error.css )
Rails.application.config.assets.precompile += %w( error_style.css )
Rails.application.config.assets.precompile += %w( authorization.js authorization.css )
Rails.application.config.assets.precompile += %w( flights.js flights.css )
Rails.application.config.assets.precompile += %w( tours.js tours.css )
Rails.application.config.assets.precompile += %w( dashboard.js dashboard.css )
