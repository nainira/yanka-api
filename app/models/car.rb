class Car < ActiveRecord::Base
  validates :number, presence: true, uniqueness: true
  has_many :comments, dependent: :destroy
end
