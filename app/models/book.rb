class Book < ApplicationRecord

    has_many :collections
    has_many :users

    #Book belongs to Genre, but not as a join for genre and author
    belongs_to :genre

    #Book belongs to Author, but not as a join -- can see what genres one specific author writes by mapping through Author.books and selecting only the Genre attribute or book.genre
    belongs_to :author

    #the epub file
    has_one_attached :epub

    # def public_epub_url
    #     if self.epub&.attachment
    #         if Rails.env.development?
    #             self.epub_url = Rails.application.routes.url_helpers.rails_blob_url(self.epub, only_path: true)
    #         else
    #             self.epub_url = self.epub&.service_url&.split("?")&.first
    #         end
    #     end
    #     #set a default lazily
    #     # self.epub_url ||= ActionController::Base.helpers.asset_path("../books/jianghu.epub")
    # end

    def add_epub_url
        if self.epub.attachment
            self.epub.key << ".epub"
            self.epub_url = self.epub.service_url.split("?").first
        end
    end
    #this works - the bucket wasn't public before
    #need the aws url because ReactReader needs a public url to work (no local path)

end
