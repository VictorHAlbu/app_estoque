class DespesasController < ApplicationController
  before_action :set_despesa, only: [:show, :edit, :update, :destroy]

  # GET /despesas
  # GET /despesas.json
  def index
    @despesas = Despesa.all
  end

  # GET /despesas/1
  # GET /despesas/1.json
  def show
  end

  # GET /despesas/new
  def new
    @despesa = Despesa.new
  end

  # GET /despesas/1/edit
  def edit
  end

  # POST /despesas
  # POST /despesas.json
  def create
    @despesa = Despesa.new(despesa_params)

    respond_to do |format|
      if @despesa.save
        format.html { redirect_to @despesa, notice: 'Despesa was successfully created.' }
        format.json { render :show, status: :created, location: @despesa }
      else
        format.html { render :new }
        format.json { render json: @despesa.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /despesas/1
  # PATCH/PUT /despesas/1.json
  def update
    respond_to do |format|
      if @despesa.update(despesa_params)
        format.html { redirect_to @despesa, notice: 'Despesa was successfully updated.' }
        format.json { render :show, status: :ok, location: @despesa }
      else
        format.html { render :edit }
        format.json { render json: @despesa.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /despesas/1
  # DELETE /despesas/1.json
  def destroy
    @despesa.destroy
    respond_to do |format|
      format.html { redirect_to despesas_url, notice: 'Despesa was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_despesa
      @despesa = Despesa.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def despesa_params
      params.require(:despesa).permit(:nome, :descricao, :valor)
    end
end
