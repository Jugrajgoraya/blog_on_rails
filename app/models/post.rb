class Post < ApplicationRecord

    has_many :comments

    validates :title, presence: { message: "must be provided" }, uniqueness: true
    validates :body, presence: {message: "must be provided"}, length: {minimum:50} 
end
