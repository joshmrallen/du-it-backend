class WordListsController < ApplicationController

    def destroy
        association = WordList.find_by(user_id: params[:user_id], word_id: params[:word_id])
        word = association.word.word
        association.destroy
        render json: { message: `#{word} has been removed from this user's list`}
    end

end
