class ConcertsController < ApplicationController

	def index
	end

	def new
		@concert = Concert.new #create instance of concert
	end

	def create
		@concert = Concert.new(params.require(:concert).permit(:title, :description, :band))
	end


	private 

	def concert_params
		params.require(:concert).permit(:title, :description, :director)
	end


end
