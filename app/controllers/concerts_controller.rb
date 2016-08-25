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

	def edit
	end

	def update
		if @concert.update(concert_params)
			redirect_to concert_path(@concert)
		else
			render 'edit'
		end
	end

	def destroy
	end


	private 

	def concert_params
		params.require(:concert).permit(:title, :description, :director)
	end

	def find_concert
		@concert = Concert.find(params[:id])
	end


end
