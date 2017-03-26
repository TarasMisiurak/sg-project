class PagesController < ApplicationController

	def show
		if valid_page?
			render template: "pages#{params[:page]}"
		else
			render file: "public/404.html", status: :not_found
		end

		@recent_posts = Post.offset(10).order('created_at DESC')
	end

	private

	def valid_page?
		File.exist?(Pathname.new(Rails.root + "app/views/pages/#{params[:page]}.html.erb"))
	end

end
