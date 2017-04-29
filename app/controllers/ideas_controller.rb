class IdeasController < ApplicationController
	
	def index
		@ideas = Idea.select('ideas.*, COUNT(likes.id) like_count').joins('LEFT OUTER JOIN likes ON likes.idea_id = ideas.id').group('ideas.id').order('like_count DESC')
		# @ideas = Idea.select('ideas.*, COUNT(likes.id) like_count').joins(:likes).group('ideas.id').order('like_count DESC')
	end	

	def create
		idea = Idea.new(idea_params.merge(user:User.find(current_user.id)))
		if idea.save
			redirect_to '/ideas'
		else
			flash[:errors] = '*Idea Must Be 5 characters'
			redirect_to '/ideas'
		end	
	end	

	def show
		@idea = Idea.find(params[:id])
		@users = Idea.find(params[:id]).idea_likes
	end	

	def like 
		like = Like.new(user:User.find(current_user.id),idea:Idea.find(params[:id]))
		if like.save
			redirect_to '/ideas'
		else
			redirect_to '/ideas'
		end		
	end	

	def destroy
		Idea.find(params[:id]).destroy
		redirect_to '/ideas'
	end

	private
		def idea_params
			params.require(:idea).permit(:idea)
		end	
end
