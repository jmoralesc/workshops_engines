require_dependency "workshops_engine/application_controller"

module WorkshopsEngine

  class WorkshopsController < ApplicationController
    before_action :find_workshop, only: [:show, :edit, :update, :destroy]

    
    def index
      @workshops = Workshop.all
    end

    def show
    end

    def new
      @workshop = Workshop.new
    end

    def edit
    end

    def create
      @workshop = Workshop.new(workshop_params)
      if @workshop.save
        redirect_to @workshop, notice: 'Workshop was successfully created.'
      else
        render :new
      end
    end

    def update
      if @workshop.update(workshop_params)
        redirect_to @workshop, notice: 'Workshop was successfully updated.'
      else
        render :edit
      end
    end

    def destroy
      @workshop.destroy
      redirect_to badges_url, notice: 'Workshop was successfully destroyed.'
    end
    
    private

    def find_workshop
      @workshop = Workshop.find(params[:id])
    end
    
    def workshop_params
      params.require(:workshop).permit(:tile, :description, :date_and_time, :user_id)
    end
  end
end
