class GraduatingClass < ApplicationRecord
validates :gradYear, uniqueness: true
has_many :students

end
