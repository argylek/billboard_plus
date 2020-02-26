class Artist < ApplicationRecord
  belongs_to :user

  has_many :songs
  has_many :billboards, through: songs
end
