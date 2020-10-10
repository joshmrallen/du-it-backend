
User.delete_all
Author.delete_all
Genre.delete_all
Book.delete_all

author = Author.create(first_name: "Sam", last_name: "Wise")
wuxia = Genre.create(name: "Wuxia")

book = Book.create(title: "Jianghu", num_of_pages: 500, genre_id: wuxia.id, author_id: author.id )

binding.pry

puts "implement aws storage so we can use the ReactReader component already"


# require 'google/cloud/translate'



# project_id = 'reader-291719'

# text = '你好'

# language_code = 'en'

# translate = Google::Cloud::Translate.translation_v2_service project_id: project_id
# translation = translate.translate text, to: language_code

# puts "Translated '#{text}' to '#{translation.text.inspect}'"

# puts "Original language: #{translation.from} translated to: #{translation.to}"