class SessionsController < ApplicationController
	
	def create
		user = User.find_by(email:login_params[:email])
		if user && user.authenticate(login_params[:password])
			session[:user_id]= user.id
			redirect_to '/ideas'
		else
			flash[:login_errors] = "Invalid Credentials"
			redirect_to '/'	
		end	
	end	

	def destroy
		session.clear
		redirect_to '/'
	end	
	
	private
		def login_params
			params.require(:login).permit(:email,:password)
		end	
end
