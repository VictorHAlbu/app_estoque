class ProdutosController < ApplicationController
  before_action :set_produto, only: [:show, :edit, :update, :destroy]

 
  def index
    @produtos = Produto.all
  end

  
  def show
  end


  def new
    @produto = Produto.new
  end

 
  def edit
  end

  def import
    @import_excel = ImportProductExcel.new(params[:file])
    if @import_excel.import
       redirect_to produtos_url, notice: 'Arquivo Importado' 
    else
      redirect_to produtos_url, notice: 'Erro ao Importar '
    end
  end

 
  def create
    @produto = Produto.new(produto_params)

    respond_to do |format|
      if @produto.save
        format.html { redirect_to @produto, notice: 'Produto was successfully created.' }
        format.json { render :show, status: :created, location: @produto }
      else
        format.html { render :new }
        format.json { render json: @produto.errors, status: :unprocessable_entity }
      end
    end
  end

 
  def update
    respond_to do |format|
      if @produto.update(produto_params)
        format.html { redirect_to @produto, notice: 'Produto was successfully updated.' }
        format.json { render :show, status: :ok, location: @produto }
      else
        format.html { render :edit }
        format.json { render json: @produto.errors, status: :unprocessable_entity }
      end
    end
  end

 
  def destroy
    @produto.destroy
    respond_to do |format|
      format.html { redirect_to produtos_url, notice: 'Produto was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
   
    def set_produto
      @produto = Produto.find(params[:id])
    end

   
    def produto_params
      params.require(:produto).permit(:nome, :descricao, :quantidade, :vecimento, :preco_compra, :preco_venda)
    end
end
