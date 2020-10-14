class UsersController < ApplicationController

    def show
        user = User.find(params[:id])
        render json: UserSerializer.new(user).to_serialized_json
    end

    def create
        user = User.create(user_params)
        user.initialize_default_collection
        render json: UserSerializer.new(user).to_serialized_json
    end

    def add_word
        user = User.find(params[:id])
        word = params[:word]
        user.add_new_word(word)
        render json: UserSerializer.new(user).to_serialized_json
    end

    private

    def user_params
        params.require(:user).permit(:first_name, :last_name, :email)
    end
end
