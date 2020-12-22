class Produto < ApplicationRecord
    validates :nome, presence: true
end
