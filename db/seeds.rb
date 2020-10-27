# User.delete_all
# Book.delete_all
Word.delete_all

#seed new words
user = User.all.first
word = "好吃"
user.add_new_word(word)
puts "New word has been added: #{user.words[0]}"
puts "Female Voice URL: #{user.words[0].female_voice_url}"
puts "Male Voice URL: #{user.words[0].male_voice_url}"

# seed the default books for the collections

# literature = Genre.find_by(name: "Literature")

# xiyouji = Book.create(title: "西游记", genre_id: literature.id, author_id: 5, epub_url: "https://du-it-dev.s3.amazonaws.com/xiyouji.epub")

# cao = Author.create(first_name: "雪芹", last_name: "曹")
# hongloumeng = Book.create(title: "红楼梦", genre_id: literature.id, author_id: cao.id, epub_url: "https://du-it-dev.s3.amazonaws.com/hongloumeng.epub")

# luo = Author.create(first_name: "贯中", last_name: "罗")
# sanguoyanyi = Book.create(title: "三国演义", genre_id: literature.id, author_id: luo.id, epub_url: "https://du-it-dev.s3.amazonaws.com/sanguoyanyi.epub")

#haven't seeded yet


#Text to Speech Language codes:
#English: "en-US"
#Mandarin: "cmn-CN", female: "cmn-CN-Standard-A", male: "cmn-CN-Standard-A"

# client = Google::Cloud::TextToSpeech.text_to_speech

#Taking out punctuation since last time it didn't play the 'world' part
# synthesis_input = { text: "你好世界"}

# voice = {
#         language_code: "cmn-CN",
#         name: "cmn-CN-Standard-A"
#         # ssml_gender: "FEMALE"
# }

# audio_config = { audio_encoding: "MP3" }

# response = client.synthesize_speech(
#         input: synthesis_input,
#         voice: voice,
#         audio_config: audio_config
# )

# File.open "output.mp3", "wb" do |file|
#         file.write response.audio_content
# end

# puts "Audio content written to file 'output.mp3'"






# author = Author.create(first_name: "Gao", last_name: "Ming")
# lit = Genre.create(name: "Literature")

# # book = Book.create(title: "海島算經", num_of_pages: 500, genre_id: lit.id, author_id: author.id )

# # book.epub.attach(io: File.open("/Users/Josh/Flatiron/mod-5/project/hai.epub"), filename: "hai.epub", content_type: 'application/epub+zip')

# book = Book.create(title: "pipaji", num_of_pages: 500, genre_id: lit.id, author_id: author.id)

# file_path = "/Users/Josh/Flatiron/mod-5/project/pipaji.epub"
# file_size = File.new(file_path).size
# file_checksum = Digest::MD5.file(file_path).base64digest

# ActiveStorage::Blob.create_before_direct_upload!(filename: "pipaji.epub", byte_size: file_size, checksum: file_checksum)
# blob_id = ActiveStorage::Blob.last.id
# blob = ActiveStorage::Blob.find_by(id: blob_id)
# epub_key = blob.key << ".epub"
# blob.update(key: epub_key)
# blob.upload(io: File.open(file_path), content_type: "application/epub+zip", identify: false)
        # try using ActiveStorage::Service.last.upload(key: blob.key, io: File.open(file_path))
# ActiveStorage::Attachment.create(name: 'epub', record_type: 'Book', record_id: book.id, blob_id: blob_id)



# binding.pry

# book.add_epub_url

# book.save!

# binding.pry

# puts "complete"





# project_id = 'reader-291719'

# text = '你好'

# language_code = 'en'

# require 'google/cloud/translate'

# translate = Google::Cloud::Translate.translation_v2_service project_id: project_id
# translation = translate.translate text, to: language_code

# puts "Translated '#{text}' to '#{translation.text.inspect}'"

# puts "Original language: #{translation.from} translated to: #{translation.to}"