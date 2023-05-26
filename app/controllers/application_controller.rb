class ApplicationController < ActionController::API
    #application controller parent class hai.....baki sb controller application controller se inherit hoti hai
    def current_user
        @current_user ||= User.find_by(token: params[:token])

    end
end
