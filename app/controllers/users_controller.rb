class UsersController < ApplicationController

    def create
        user = User.create(user_params)
        user.initialize_default_collection
        render :json #TODO: make user_serializer that includes books for response
    end

    private

    def user_params
        params.require(:user).permit(:first_name, :last_name, :email)
    end
end
