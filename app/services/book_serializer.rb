class BookSerializer

    def initialize(book_object)
        @book = book_object
    end

    def to_serialized_json

        options = {
            except: [:genre_id, :author_id, :created_at, :updated_at],
            include: {
                genre: {
                    only: [:name]
                },
                author: {
                    only: [:first_name, :last_name]
                }
            }
        }
        @book.to_json(options)
    end

end