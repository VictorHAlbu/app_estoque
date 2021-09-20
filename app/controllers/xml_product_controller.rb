class XmlProductController < ApplicationController
  def create
		begin
			Produto.call(params[:file])
			redirect_to purchases_path, notice: "XML de Produto Importado"
		rescue => error
			redirect_to purchases_path, alert: error.message
		end
	end

end
