class ConsultaController < ApplicationController
  before_action :set_consultum, only: %i[ show edit update destroy ]
  before_action :store_referer, only: [:new, :edit]



  # GET /consulta or /consulta.json
  def index
    @q = Consultum.ransack(params[:q])
    @pagy, @consultas = pagy(@q.result(distinct: true).order(data_consulta: :desc))
    @pacientes = Paciente.all
    @medicos = Medico.all
    
    if params[:id]
      @variavelnovadoid = Consultum.find(params[:id])
    else
      @variavelnovadoid = Consultum.last
    end
  end
  
  

  # GET /consulta/1 or /consulta/1.json
  def show
  end

  # GET /consulta/new
  def new
    @medicos = Medico.all
    @pacientes = Paciente.all
    @consultum = Consultum.new
  end


  # GET /consulta/1/edit
  def edit
    @consulta = Consultum.all
    @pacientes = Paciente.all
    @medicos = Medico.all
  end

  # POST /consulta or /consulta.json
  def create
    @consultum = Consultum.new(consultum_params)
  
    respond_to do |format|
      if @consultum.save
        referer_url = session.delete(:referer) || consultum_url(@consultum)
        format.html { redirect_to referer_url, notice: "Consultum was successfully created." }
        format.json { render :show, status: :created, location: @consultum }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @consultum.errors, status: :unprocessable_entity }
      end
    end
  end
  
  

  # PATCH/PUT /consulta/1 or /consulta/1.json
  def update
    respond_to do |format|
      if @consultum.update(consultum_params)
        referer_url = session.delete(:referer) || consultum_url(@consultum)
        format.html { redirect_to referer_url, notice: "Consultum was successfully updated." }
        format.json { render :show, status: :ok, location: @consultum }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @consultum.errors, status: :unprocessable_entity }
      end
    end
  end
  
  
  

  # DELETE /consulta/1 or /consulta/1.json
  def destroy
    @consultum.destroy!

    respond_to do |format|
      format.html { redirect_to consulta_url, notice: "Consultum was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

    def store_referer
      session[:referer] = request.referer
    end
    # Use callbacks to share common setup or constraints between actions.
    def set_consultum
      @consultum = Consultum.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def consultum_params
      params.require(:consultum).permit(:medico_id, :paciente_id, :data_consulta, :ficha, :tipo, :favorito, :status)
    end
end
