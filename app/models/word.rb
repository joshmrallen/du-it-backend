class Word < ApplicationRecord

    validates :word, uniqueness: true

    has_many :word_lists
    has_many :users, through: :word_lists

    def define
        project_id = "reader-291719"
        define = Google::Cloud::Translate.translation_v2_service project_id: project_id
        definition = define.translate self.word, to: 'en'
        self.definition = definition.text
        self.save!
    end

    def get_pinyin
        pinyin = PinYin.of_string(self.word, :unicode)
        self.pinyin = pinyin.join(" ")
        self.save!
    end

end
