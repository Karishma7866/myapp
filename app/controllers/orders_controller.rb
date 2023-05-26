class OrdersController < ApplicationController
    before_action :get_order, only: [:show_order, :update_order, :destroy_order]
    def create_order
        order = current_user.orders.build(order_params)
        if order.save
            render json: {
                "order_no" => order.order_no,
                "name" => order.name,
                "description" => order.description,
                "price" => order.price,
                "quantity" => order.quantity,
                "order_items" => get_order_items(order.order_items)
        }
        else
            render json: {error: 'order not insert'}
        end
    end
    def index
        @order= Order.all
         render json: @order
    end
    def show_order
        #order = current_user.orders.find_by(id: params[:id])
        if @order.present?
        #hash
        #render json: {
            #"order_no" => @order.order_no,
            #"name" => @order.name,
            #"description" => @order.description,
            #"price" => @order.price,
            #"quantity" => @order.quantity,
            #"order_items" => get_order_items(@order.order_items) 
        #}
        #serializer
        #render json: OrderSerializer.new(@order, meta: {message: 'order list'}
        render json: OrderSerializer.new(@order).serializable_hash, status:200
        
        else
        render json: {error: 'order not found'}
        end
    end
     def update_order
        if @order.present?
            @order.update(order_params)
            render json: {
            "order_no" => @order.order_no,
            "name" => @order.name,
            "description" => @order.description,
            "price" => @order.price,
            "quantity" => @order.quantity,
            "order_items" => get_order_items(@order.order_items) 
        }
        else
            render json: {error: "record not updated"}
        end
    end
    def destroy_order
        if @order.present?
            @order.destroy
            render json: {message: "record deleted"}
        else
            render json: {error: "record not deleted"}
        end
    end

private
def order_params
    params.require(:order).permit(:order_no, :name, :description, :price, :quantity, :user_id, order_items_attributes: [:id, :name, :description, :price, :quantity, :order_id, :user_id])
end
def get_order
    @order = current_user.orders.find_by(id: params[:id])
end
def get_order_items(order_items)
    oi1 = [] #hash
    order_items.each do | order_item |
    oi = {}  #hash
        oi["id"] =order_item.id
        oi["name"] = order_item.name
        oi["description"] = order_item.description
        oi["price"] = order_item.price
        oi["quantity"] = order_item.quantity
        oi1 << oi
    end
    oi1
end
end
