class Produto < ApplicationRecord
    require 'nokogiri'

    validates :nome, presence: true

end
