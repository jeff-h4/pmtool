class Project < ActiveRecord::Base
  validates :title, presence: true, uniqueness: true
  has_many :discussions, dependent: :destroy
end
