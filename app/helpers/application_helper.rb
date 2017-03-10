module ApplicationHelper

	def active_page_class(path)
		current_page?(path) ? "active" : ""
	end

end
