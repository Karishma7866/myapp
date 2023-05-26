class ProfilesController < ApplicationController
    def create
        #byebug
        #user = User.find_by(id: params[:id])# first user find kiye
        profile = current_user.build_profile(profile_params)#then us user ki profile build karwayi
        #profile = Profile.new(profile_params)
        if profile.save
            render json: profile
        else
            render json: {error: 'record not inserted'}
        end
    end
    def update
        user = User.find_by(id: params[:id])
        profile = user.profile
        if profile.present?
            profile.update(profile_params)
            render json: {message: 'record updated successfully'}
        else
            render json: {error: 'record not updated'}
        end
    end

    def index
        profiles = Profile.all
        render json: profiles
    end
    def show
        profile = current_user.profile   # find by current user (active user who is login)
        # profile = Profile.find_by(id: params[:id])    -----find by id
        if profile.present?
          render json: profile
        else
          render json: {error: "Profile not found"}
        end
    end

    def destroy
        user = User.find_by(id: params[:id])
        profile = user.profile
        #profile = Profile.find_by(id: params[:id])
        if profile.present?
            profile.destroy
            render json: {message: 'record deleted'}
        else
            render json: {message: 'record not deleted'}
        end
    end

    private
    def profile_params
        params.require(:profiles).permit(:address, :phone_number, :city, :state, :country, :user_id)
    end
end
