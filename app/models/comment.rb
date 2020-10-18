class Comment < ApplicationRecord
  belongs_to :post # привязка к определённому посту
end
