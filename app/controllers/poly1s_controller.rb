class Poly1sController < ApplicationController
    def create
        poly1 = Poly1.new(poly1_params)
            if poly1.save
            render json: poly1
            else
            render json: {error: 'poly1 not inserted'}
            end
    end
    def index
        poly1s = Poly1.all
        render json: poly1s

    end

    private
    def poly1_params
        params.require(:poly1s).permit(:poly1_title, :description)
    end
end
