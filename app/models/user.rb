class User < ApplicationRecord
    validates :first_name, presence: true
    validates :last_name, presence: true
    validates :status, presence: true
    validates :email, presence: true
    validates :created_at, presence: true
end
