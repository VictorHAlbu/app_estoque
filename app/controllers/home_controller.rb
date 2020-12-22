class HomeController < ApplicationController
    def index
    @receitas = Receita.sum(:valor)
    @despesas = Despesa.sum(:valor)  
    @pedidos = Receita.sum(:valor_total)  

    end  

end
