module RegistrationHelper
	def show_devise_error_messages!
		return "" if resource.errors.empty?

		messages = resource.errors.full_messages.map { |msg| content_tag(:div, msg, :class => "error") }.join		

		html = <<-HTML
			<div class="div_error">
				#{messages}
			</div>
		HTML

		html.html_safe
	end
		
end
