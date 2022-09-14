class PainsController < ApplicationController
    def index
        @pains = Pain.all
        render json: @pains
    end

    def show
        @pain = Pain.find(params[:id])
        render json: @pain
    end

    def update
        @pain = Pain.find(params[:id])
        @pain.update(pain_params)
        render json: @pain
    end

    def destroy
        @pain = Pain.find(params[:id])
        @pain.destroy
        render json: @pain
    end

    def create
        @pain = Pain.create(pain_params)
        render json: @pain
    end


    def pain_params
        params.require(:pain).permit(:comment, :level, :sensation, :internality, :location)
    end
end
