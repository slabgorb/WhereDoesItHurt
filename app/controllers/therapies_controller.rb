class TherapysController < ApplicationController
    def index
        @therapys = Therapy.all
        render json: @therapys
    end

    def show
        @therapy = Therapy.find(params[:id])
        render json: @therapy
    end

    def update
        @therapy = Therapy.find(params[:id])
        @therapy.update(therapy_params)
        render json: @therapy
    end

    def destroy
        @therapy = Therapy.find(params[:id])
        @therapy.destroy
        render json: @therapy
    end

    def create
        @therapy = Therapy.create(therapy_params)
        render json: @therapy
    end


    def therapy_params
        params.require(:therapy).permit(:comment, :action, :efficacy, :duration)
    end
end
