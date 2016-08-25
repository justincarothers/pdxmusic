class ConcertsController < ApplicationController

	before_action :find_concert, only: [:show, :edit, :update, :destroy]

	def index
		@concerts = Concert.all.order("created_at DESC")
	end

	def show
		
	end

	def new
		@concert = Concert.new #create instance of concert
	end

	def create
		@concert = Concert.new(params.require(:concert).permit(:title, :description, :band))

		if @concert.save
			redirect_to root_path
		else
			render 'new'
		end
	end


	private 

	def concert_params
		params.require(:concert).permit(:title, :description, :director)
	end

	def find_concert
		@concert = Concert.find(params[:id])
	end


end
