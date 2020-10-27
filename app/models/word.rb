class Word < ApplicationRecord

    validates :word, uniqueness: true

    has_many :word_lists
    has_many :users, through: :word_lists

    has_many_attached :voices

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

    def get_voices
        #functionality kept to one method to limit multiple "clients"
        client = Google::Cloud::TextToSpeech.text_to_speech

        synthesis_input = { text: self.word}

        female_voice = {
            language_code: "cmn-CN",
            name: "cmn-CN-Standard-A"
        }

        male_voice = {
            language_code: "cmn-CN",
            name: "cmn-CN-Standard-C"
        }

        audio_config = { audio_encoding: "MP3" }

        female_response = client.synthesize_speech(
            input: synthesis_input,
            voice: female_voice,
            audio_config: audio_config
        )

        male_response = client.synthesize_speech(
            input: synthesis_input,
            voice: male_voice,
            audio_config: audio_config
        )

        #write each response's audio_content property into a file and attach said file:
        #female voice audio:
        byebug
        self.voices.attach( 
            io: File.open("#{self.word}_female.mp3", "wb"){ |file| file.write female_response.audio_content },
            filename: "#{self.word}_female.mp3",
            content_type: 'audio/mpeg',
            identify: false
        )
        #male voice audio:
        self.voices.attach(
            io: File.open("#{self.word}_male.mp3", "wb"){ |file| file.write male_response.audio_content },
            filename: "#{self.word}_male.mp3",
            content_type: 'audio/mpeg',
            identify: false
        )

        #save url's to respective columns
        get_voice_urls

    end

    #method to save url for each voice into its respective attribute
    def get_voice_urls
        self.female_voice_url = url_for(self.voices[0])
        self.male_voice_url = url_for(self.voices[1])
    end

end
