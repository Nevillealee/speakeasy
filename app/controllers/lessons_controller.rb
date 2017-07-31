class LessonsController < ApplicationController
    before_action :authenticate_user!
    before_action :enrolled
    
    def show
    end
    
    helper_method :current_lesson, :enrolled
      def current_lesson
        @current_lesson ||= Lesson.find(params[:id])
      end
      
      def enrolled
        @course = current_lesson.section.course
        if current_user.enrolled_in?(@course)
          return current_user.enrolled_in?(@course)
        else 
          redirect_to course_path(current_lesson.section.course), alert: 'You need to enroll in  order to access this lesson'
        end
      end
      
      
end
