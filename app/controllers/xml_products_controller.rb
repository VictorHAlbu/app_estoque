class XmlProductsController < ApplicationController

  def index
    
  end

  def create
		begin
			@nefe = XmlProduct.import(params[:file])
			redirect_to purchases_path, notice: "XML de Produto Importado"
		rescue => error
			redirect_to purchases_path, alert: error.message
		end
	end

end
