class UserSerializer
    def initialize(user_object)
        @user = user_object
    end

    def to_serialized_json
        options = {
            except: [:created_at, :updated_at],
            include: {
                books: {
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
            }
        } 
        @user.to_json(options)
    end
end