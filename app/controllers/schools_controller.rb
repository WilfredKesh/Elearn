class SchoolsController < ApplicationController

	before_action :set_school

	def show
		render json: @school
	end


	def update
		if @school.update(school_params)
			render json: @school
		end
	end

	private

	def school_params
		params.require(:school).permit(:name , :thumbnail)
	end

	def set_school

		@school = School.find(params[:id])
	end





end