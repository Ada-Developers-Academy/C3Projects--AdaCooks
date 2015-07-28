module UsersHelper

	def error_check(attribute)
		if @user.errors[attribute].any?
			flash.now[(attribute.to_s + "_error").to_sym] = (@user.errors.messages[attribute][0].capitalize + ".")
		end
	end
end
