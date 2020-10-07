class Book < ApplicationRecord

    has_many :collections
    has_many :users

    #Book belongs to Genre, but not as a join for genre and author
    belongs_to :genre

    #Book belongs to Author, but not as a join -- can see what genres one specific author writes by mapping through Author.books and selecting only the Genre attribute or book.genre
    belongs_to :author


end
