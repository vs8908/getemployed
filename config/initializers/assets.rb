# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'

# Add additional assets to the asset load path.
# Rails.application.config.assets.paths << Emoji.images_path
# Add Yarn node_modules folder to the asset load path.
Rails.application.config.assets.paths << Rails.root.join('node_modules')

# Precompile additional assets.

# application.js, application.css, and all non-JS/CSS in the app/assets
# folder are already added.
Rails.application.config.assets.precompile += %w( start.js modernizr-2.8.3-respond-1.4.2.min.js jquery-1.11.2.min.js bootstrap.min.js plugins.js main.js  quiz.js question.js app.js my_calendar.js vendor/adminlte/**/*.js vendor/adminlte/**/**/*.css vendor/adminlte/**/*.scss theme.scss theme.js)

Rails.application.config.assets.paths << Rails.root.join('vendor', 'adminlte', 'plugins')
Rails.application.config.assets.paths << Rails.root.join('vendor', 'adminlte', 'css')
Rails.application.config.assets.paths << Rails.root.join('vendor', 'adminlte', 'js')
Rails.application.config.assets.paths << Rails.root.join('vendor', 'adminlte', 'img')
Rails.application.config.assets.paths << Rails.root.join('vendor', 'adminlte')
Rails.application.config.assets.paths << Rails.root.join('assets', 'stylesheets', "*.css")
Rails.application.config.assets.paths << Rails.root.join('assets', 'stylesheets', "application.scss")
Rails.application.config.assets.paths << Rails.root.join('assets', 'stylesheets', "*.min.css")
Rails.application.config.assets.paths << Rails.root.join('assets', 'stylesheets', "*.scss")
Rails.application.config.assets.paths << Rails.root.join('assets', 'javascripts', "*.js")
Rails.application.config.assets.paths << Rails.root.join('assets', 'stylesheets', 'fonts')
Rails.application.config.assets.precompile += %w(bootstrap.min.css plugins.css  style.css responsive.css)
