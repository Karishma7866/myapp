class UsersController < ApplicationController
    def create
        # User user = new User();   ---- java
        user = User.new(user_params)
        if user.save
            # render json: {message: 'user insert successfull'}
            render json: user
        else
            render json: {error: 'user not inserted'}
        end
    end

    def update
        user = User.find_by(id: params[:id])
        if user.present?
            user.update(user_params)
            render json: {message: 'record updated successful'}
        else
            render json: {error: 'record not updated'}
        end
    end

    def index
        users = User.all
        render json: users

    end
    def show
        user = User.find_by(id: params[:id])#is method se hame current user ke sath uski profile bhi show
        #hash
        #render json:{         
            #"first_name" => user.first_name,
            #"last_name" => user.last_name,
            #"email" => user.email,
            #"active" => user.active,
            #"token" => user.token,
                    #"profile" => {
                            #"phone" => user.profile.phone_number,
                            #"city" => user.profile.city,
                            #"state" => user.profile.state,
                            #"country" => user.profile.country

                            #dono se kr sakate hai
                            
                            #"address" => user.profile.present? ? user.profile.phone_address : "vidhan nager",
                            #"phone" => user.profile.present? ? user.profile.phone_number : "8275378634",
                            #"city" => user.profile.present? ? user.profile.city : "nagpur",
                            #"state" => user.profile.present? ? user.profile.state : "maharashtra",
                            #"country" => user.profile.present? ? user.profile.country : "india"
                   # }
            #}
            #serializer
        render json: UserSerializer.new(user).serializable_hash, status:200
            
    end
    
    def destroy
        user = User.find_by(id: params[:id])
        if user.present?
            user.destroy
            render json: {message: 'record deleted'}
        else
            render json: {message: 'error'}
        end
    end
    def bulk_orders_delete
        orders = current_user.orders.where(id: params[:order_ids])
        if orders.present?
            orders.destroy_all
            render json: {message: 'all orders deleted'}
        else
            render json: {error: 'orders not found'}
        end
    end
    def orders_by_user
        orders = current_user.total_orders
        render json: orders
    end
    private
    def user_params
    params.require(:users).permit(:first_name, :last_name, :email, :active, :token)
    end

end
