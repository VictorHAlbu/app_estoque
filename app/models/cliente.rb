class Cliente < ApplicationRecord
    validates :nome, :telefone, presence: true
end
