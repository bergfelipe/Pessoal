class HomeController < ApplicationController
  def index
    @q = Consultum.ransack(params[:q])
    @pagy, @consultas = pagy(@q.result(distinct: true).order(created_at: :desc))    
    @medicos = Medico.all
    @pacientes = Paciente.all
  end
end
