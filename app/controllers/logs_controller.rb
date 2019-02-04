class LogsController < ApplicationController
  def create
    log_decoded = eval((::Authenticator.new(encrypted_param).decode).first)

    log = Log.new(log_decoded)
    if log.save
      render json: log, status: :ok
    else
      render json: { 'error': 'Não foi possível salvar o registro' }, status: :unprocessable_entity
    end
  end

  private

  def encrypted_param
    params.require(:encrypted_param)
  end
end
