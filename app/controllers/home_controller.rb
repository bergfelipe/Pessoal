class HomeController < ApplicationController
  def index
    @q = Consultum.ransack(params[:q])
    @pagy, @consultas = pagy(@q.result(distinct: true))
    @medicos = Medico.all
  end
end
