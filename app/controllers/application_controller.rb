class ApplicationController < ActionController::Base
	before_action :set_current_user
	
	
	def set_current_user
	@current_user=User.find_by(id: session[:user_id])
	end	
	def authenticate_user
		if @current_user==nil
			flash[:notice]="NO RIGHT1"
			redirect_to("/")
		end
	end	
	def forbid_current
		if @current_user
			flash[:notice] ="already logged in"
		redirect_to("/posts/index")
		end
	end
	def confirm
		if @current_user.id != params[:id].to_i
			flash[:notice]="NO RIGHT2"
			redirect_to("/posts/index")
		end
	end
end
