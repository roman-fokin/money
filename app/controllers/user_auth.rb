class UserAuth < ApplicationController
    before_action :check_authentication

    private

    def check_authentication 
        redirect_to home_path unless current_user
    end
end