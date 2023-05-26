class RelatesController < ApplicationController
    def create
        relate = Relate.new(relate_params)
            if relate.save
            render json: relate
            else
            render json: {error: 'relate not inserted'}
            end
        end
        def index
            case params[:type]
            when "poly1"
                relates = Relate.where(relatable_type: "Poly1")
            when "event"
                relates = Relate.where(relatable_type: "Poly2")
            when "forum"
                relates = Relate.where(relatable_type: "Poly3")
            else
                crelates = Relate.all
            end
            render json: relates
                
        end
        private
        def relate_params
            params.require(:relates).permit(:content, :relatable_id, :relatable_type)
        end
end
