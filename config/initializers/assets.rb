# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'

Rails.application.config.assets.precompile += %w( '.ttf' )
Rails.application.config.assets.precompile += %w( '.eot' )
Rails.application.config.assets.precompile += %w( '.woff' )
Rails.application.config.assets.precompile += %w( '.woff2' )
Rails.application.config.assets.precompile += %w( '.svg' )

Rails.application.config.assets.precompile += %w( users/auth_styles.css )
Rails.application.config.assets.precompile += %w( page_header.css )

Rails.application.config.assets.precompile += %w( users/auth_scripts.js )
Rails.application.config.assets.precompile += %w( scripts.js )

# Add additional assets to the asset load path
# Rails.application.config.assets.paths << Emoji.images_path

# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in app/assets folder are already added.
# Rails.application.config.assets.precompile += %w( search.js )
