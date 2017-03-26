class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  	before_action :set_locale

  	before_filter :set_current_user

	def set_current_user
    	User.current = current_user
	end
 	
 	private

	def extract_locale_from_accept_language_header
		request.env['HTTP_ACCEPT_LANGUAGE'].scan(/^[a-z]{2}/).first
	end

	def set_locale
		I18n.locale = session[:locale] || I18n.default_locale
		session[:locale] = I18n.locale
	end

	rescue_from CanCan::AccessDenied do |exception|
		redirect_to main_app.root_path, :alert => exception.message
	end
	 
	# Get locale from top-level domain or return nil if such locale is not available
	# You have to put something like:
	#   127.0.0.1 application.com
	#   127.0.0.1 application.it
	#   127.0.0.1 application.pl
	# in your /etc/hosts file to try this out locally
	def extract_locale_from_tld
	  parsed_locale = request.host.split('.').last
	  I18n.available_locales.map(&:to_s).include?(parsed_locale) ? parsed_locale : nil
	end

end
