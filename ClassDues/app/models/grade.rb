class Grade < ApplicationRecord
  has_many :dues
  belongs_to :user
end
