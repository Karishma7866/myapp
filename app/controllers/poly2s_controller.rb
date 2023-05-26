class Poly2sController < ApplicationController
    def create
        poly2 = Poly2.new(poly2_params)
            if poly2.save
            render json: poly2
            else
            render json: {error: 'poly2 not inserted'}
            end
    end
    def index
        poly2s = Poly2.all
        render json: poly2s

    end

    private
    def poly2_params
        params.require(:poly2s).permit(:poly2_title, :description)
    end
end
