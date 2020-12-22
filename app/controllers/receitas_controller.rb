class ReceitasController < ApplicationController
  before_action :set_receita, only: [:show, :edit, :update, :destroy]

  # GET /receitas
  # GET /receitas.json
  def index
    @receitas = Receita.all
  end

  # GET /receitas/1
  # GET /receitas/1.json
  def show
  end

  # GET /receitas/new
  def new
    @receita = Receita.new
  end

  # GET /receitas/1/edit
  def edit
  end

  # POST /receitas
  # POST /receitas.json
  def create
    @receita = Receita.new(receita_params)

    respond_to do |format|
      if @receita.save
        format.html { redirect_to @receita, notice: 'Receita was successfully created.' }
        format.json { render :show, status: :created, location: @receita }
      else
        format.html { render :new }
        format.json { render json: @receita.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /receitas/1
  # PATCH/PUT /receitas/1.json
  def update
    respond_to do |format|
      if @receita.update(receita_params)
        format.html { redirect_to @receita, notice: 'Receita was successfully updated.' }
        format.json { render :show, status: :ok, location: @receita }
      else
        format.html { render :edit }
        format.json { render json: @receita.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /receitas/1
  # DELETE /receitas/1.json
  def destroy
    @receita.destroy
    respond_to do |format|
      format.html { redirect_to receitas_url, notice: 'Receita was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_receita
      @receita = Receita.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def receita_params
      params.require(:receita).permit(:despesas, :nome, :descricao, :valor)
    end
end
