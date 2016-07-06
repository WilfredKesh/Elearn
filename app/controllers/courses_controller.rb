class CoursesController < ApplicationController
    before_action :set_course, only: [:show, :destroy, :update]
	before_action :check_if_admin, :only => [:create, :update, :edit, :destroy]

	def index
		@courses = Course.all
		render json: @courses
	end

	def create
	   @course = Course.new(course_params)
       if @course.save
	      render json:@course
	   end
	end

	def update
		if @course.update(course_params)
			render json: @course
		end
	end



	def show
	    render json: @course
	end

	def destroy
		@course.destroy
		 render json: {}, status: :no_content
	end



	private

	def course_params
		params.require(:course).permit(:name, :description, :thumbnail)
	end

	def set_course
		@course = Course.find(params[:id])
	end



	def check_if_admin
		if current_user
			head(403) unless current_user.admin?
		end
	end



end
