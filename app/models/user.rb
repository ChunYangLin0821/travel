class User < ApplicationRecord
    validates_presence_of :name
    has_many :posts
end
