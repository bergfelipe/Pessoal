class ConsultaController < ApplicationController
  before_action :set_consultum, only: %i[show edit update destroy ativar apagar fechar concluida em_andamento]
  before_action :store_referer, only: [:new, :edit, :concluida, :em_andamento, :ativar, :apagar, :fechar]


  def concluida
    @consultum.update(status: :concluida)
    redirect_based_on_referer("Consultum foi concluída com sucesso.")
  end

  def em_andamento
    @consultum.update(status: :em_andamento)
    redirect_based_on_referer("Consultum foi marcada como em andamento.")
  end

  def ativar
    @consultum.update(status: :ativa)
    redirect_based_on_referer("Consultum foi ativada com sucesso.")
  end

  def apagar
    @consultum.update(status: :apagada)
    redirect_based_on_referer("Consultum foi apagada com sucesso.")
  end

  def fechar
    @consultum.update(status: :fechada)
    redirect_based_on_referer("Consultum foi fechada com sucesso.")
  end


  # GET /consulta or /consulta.json
  def index
    @hoje = Time.now.strftime("%H:%M:%S")
    @q = Consultum.ransack(params[:q])
    @pagy, @consultas = pagy(@q.result(distinct: true).where.not(status: :apagada).order(data_consulta: :desc))
    @pacientes = Paciente.all
    @medicos = Medico.all
    
    if params[:id]
      @variavelnovadoid = Consultum.find(params[:id])
    else
      @variavelnovadoid = Consultum.last
    end


   if  params[:status_eq].present?
   end
  end
  
  

  # GET /consulta/1 or /consulta/1.json
  def show
  end

  # GET /consulta/new
  def new
    @medicos = Medico.all
    @pacientes = Paciente.all
    @consultum = Consultum.new(
      paciente_id: params[:paciente_id], 
      medico_id: params[:medico_id], 
      tipo:  params[:tipo], 
      status: params[:status]
    )
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

  def redirect_based_on_referer(notice)
    if request.referer&.include?(home_path)
      redirect_to home_path, notice: notice
    else
      redirect_to consulta_path, notice: notice
    end
  end

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
