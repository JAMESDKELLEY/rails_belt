class UsersController < ApplicationController
	def new

	end	
	def show
		@user = User.find(params[:id])
		@like = Like.where(user:User.find(params[:id]))
		@post = Idea.where(user: User.find(params[:id]))
	end	

	def create
		user = User.create(login_params)
		if user.save
			session[:user_id] = user.id
			redirect_to '/ideas'
		else
			flash[:errors] = user.errors.full_messages
			redirect_to '/'	
		end	
	end

	private
		def login_params
			params.require(:register).permit(:name, :alias, :email, :password, :password_confirmation)
		end	
end
