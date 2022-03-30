class User < ApplicationRecord

    validates :email, presence: true, :format => /@/
    has_secure_password
    has_many :posts, dependent: :destroy
    has_many :comments, dependent: :destroy
end
