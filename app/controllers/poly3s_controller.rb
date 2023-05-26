class Poly3sController < ApplicationController
    def create
        poly3 = Poly3.new(poly3_params)
            if poly3.save
            render json: poly3
            else
            render json: {error: 'poly3 not inserted'}
            end
    end
    def index
        poly3s = Poly3.all
        render json: poly3s

    end

    private
    def poly3_params
        params.require(:poly3s).permit(:poly3_title, :description)
    end
end
