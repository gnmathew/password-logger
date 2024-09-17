class Credential < ApplicationRecord
  belongs_to :user

  validates :username, :account, :email, :password, presence: true
end
