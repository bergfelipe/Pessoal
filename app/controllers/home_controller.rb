class HomeController < ApplicationController
  def index
    @q = Consultum.ransack(params[:q])
    @pagy, @consultas = pagy(@q.result(distinct: true).where('DATE(data_consulta) = ?', Date.current).order(data_consulta: :desc))

    @medicos = Medico.all
    @pacientes = Paciente.all
    # Encontre o médico pelo CPF do administrador atual
    @medico_id = Medico.where(cpf: current_admin.cpf).ids

    # Filtre as consultas que pertencem ao médico encontrado e que a data_consulta é o dia presente
    @consulta_comp = Consultum.where(medico_id: @medico_id)
                              .where('DATE(data_consulta) = ?', Date.current)
                              .order(data_consulta: :desc)
  end
end


