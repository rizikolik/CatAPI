class Toy < ApplicationRecord

  belongs_to :cat
  validates :name,:ttype,presence:true
end
