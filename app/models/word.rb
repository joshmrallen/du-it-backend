class Word < ApplicationRecord

    validates: :word, uniqueness: true

    has_many :word_lists
    has_many :users, through: :word_lists

    def get_def
        key = ENV['API_KEY']
    end

end
