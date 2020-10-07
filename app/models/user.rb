class User < ApplicationRecord
    validates :first_name, presence: true
    validates :last_name, presence: true
    validates :email, uniqueness: true

    has_many :word_lists
    has_many :words, through: :word_lists

    has_many :collections
    has_many :books


end
