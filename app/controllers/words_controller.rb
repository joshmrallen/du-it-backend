class WordsController < ApplicationController

    def female_voice
        word = Word.find(params[:id])
        voice = word.get_female_voice
        render json: voice
    end

    def male_voice
        word = Word.find(params[:id])
        voice = word.get_male_voice
        render json: voice
    end

    # private

    # def word_param
    #     params.require(:word).permit(:id)
    # end

end
