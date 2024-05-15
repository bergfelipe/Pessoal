# frozen_string_literal: true

class Admins::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  def destroy
    super do
      # Adiciona uma mensagem flash personalizada
      flash[:notice] = "Você saiu com sucesso. Volte sempre!"
    end
  end

  protected

  # If you have extra params to permit, append them to the sanitizer.
  def after_sign_out_path_for(resource_or_scope)
    root_path # ou qualquer outro caminho
  end
end
