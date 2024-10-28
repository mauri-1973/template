# README


rails new templatenew -d postgresql

rails db:create

agregar bootstrap como gema al proyecto
		gem install bootstrap
		gem install jquery-rails
		gem install popper_js
		gem install sassc-rails
		gem install faker
		gem install figaro

2  agregamos la gema al Gemfile y ejecuta un bundle install
		bundle add bootstrap
		bundle add jquery-rails
		bundle add popper_js
		bundle add sassc-rails
		bundle add faker
		bundle add figaro => bundle exec figaro install

3 cambiar el nombre 
		application.css a application.scss
	
4 agregar en application.scss la linea
		@import "bootstrap";
	
5 agregar a application.js 
		import "bootstrap"
        //import "popper"

6 agregar en initializers/config/assets.rb
		Rails.application.config.assets.precompile += %w( application.scss bootstrap.min.js popper.js )
	
7 agregar en config/importmap.rb
		pin "popper", to: 'popper.js', preload: true
		pin "bootstrap", to: 'bootstrap.min.js', preload: true
		
8 descomentar en Gemfile y ejecutar bundle install
        gem "sassc-rails"

9 gem install devise
		bundle add devise
		rails generate devise:install
		rails g devise:views
		rails generate devise user
    rails generate devise:controllers users


* Imagenes Administrador


* Imágenes Usuario normal