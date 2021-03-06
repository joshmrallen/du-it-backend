class User < ApplicationRecord
    validates :first_name, presence: true
    validates :last_name, presence: true
    validates :email, uniqueness: true

    has_many :word_lists
    has_many :words, through: :word_lists

    has_many :collections
    has_many :books, through: :collections

    def initialize_default_collection
        xiyouji = Book.find_by(title: "西游记")
        hongloumeng = Book.find_by(title: "红楼梦")
        sanguoyanyi = Book.find_by(title: "三国演义")

        Collection.create(user_id: self.id, book_id: xiyouji.id)
        Collection.create(user_id: self.id, book_id: hongloumeng.id)
        Collection.create(user_id: self.id, book_id: sanguoyanyi.id)
    end

    def add_new_word(word)
        found = Word.find_by(word: word)
        if(found)
            if(!self.words.include?(found))
                WordList.create(user_id: self.id, word_id: found.id)
            end
        else
            newWord = Word.create(word: word)
            newWord.define
            newWord.get_pinyin
            # newWord.get_voices
            WordList.create(user_id: self.id, word_id: newWord.id)
        end
    end

end
