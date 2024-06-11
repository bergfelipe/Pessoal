class HomeController < ApplicationController
  def index
    @q = Consultum.ransack(params[:q])
    @pagy, @consultas = pagy(@q.result(distinct: true).order(created_at: :desc))    
    @medicos = Medico.all
    @pacientes = Paciente.all
    @medico_id = Medico.where(cpf: current_admin.cpf)
    @consulta_comp = Consultum.where(medico_id: @medico_id.ids)
  end
end
