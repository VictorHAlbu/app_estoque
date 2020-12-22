class FornecedoresController < ApplicationController
  before_action :set_fornecedor, only: [:show, :edit, :update, :destroy]

  # GET /fornecedores
  # GET /fornecedores.json
  def index
    @fornecedores = Fornecedor.all
  end

  # GET /fornecedores/1
  # GET /fornecedores/1.json
  def show
  end

  # GET /fornecedores/new
  def new
    @fornecedor = Fornecedor.new
  end

  # GET /fornecedores/1/edit
  def edit
  end

  # POST /fornecedores
  # POST /fornecedores.json
  def create
    @fornecedor = Fornecedor.new(fornecedor_params)

    respond_to do |format|
      if @fornecedor.save
        format.html { redirect_to @fornecedor, notice: 'Fornecedor was successfully created.' }
        format.json { render :show, status: :created, location: @fornecedor }
      else
        format.html { render :new }
        format.json { render json: @fornecedor.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /fornecedores/1
  # PATCH/PUT /fornecedores/1.json
  def update
    respond_to do |format|
      if @fornecedor.update(fornecedor_params)
        format.html { redirect_to @fornecedor, notice: 'Fornecedor was successfully updated.' }
        format.json { render :show, status: :ok, location: @fornecedor }
      else
        format.html { render :edit }
        format.json { render json: @fornecedor.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /fornecedores/1
  # DELETE /fornecedores/1.json
  def destroy
    @fornecedor.destroy
    respond_to do |format|
      format.html { redirect_to fornecedores_url, notice: 'Fornecedor was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_fornecedor
      @fornecedor = Fornecedor.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def fornecedor_params
      params.require(:fornecedor).permit(:nome, :telefone, :email, :site)
    end
end
