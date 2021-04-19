class User < ApplicationRecord
  validates :first_name,  presence: true
  validates :family_name,  presence: true
  validates :email,  presence: true,uniqueness: true
  validates :password,  presence: true
end
