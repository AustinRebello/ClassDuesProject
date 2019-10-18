class Due < ApplicationRecord
  CSV.foreach(file.path) do |row|
      duescreate! row.to_hash
    end
    belongs_to :grade
    belongs_to :user
end
