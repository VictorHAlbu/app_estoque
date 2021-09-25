class XmlProductsController < ApplicationController

  def index
    
	end

  def import
		@nefe = XmlProduct.new(params[:file])
		if @nefe.import
			redirect_to xml_products_url, notice: 'Nota Importada' 
	 else
		 redirect_to xml_products_url, notice: 'Erro ao Importar '
	 end
			
	end

end
