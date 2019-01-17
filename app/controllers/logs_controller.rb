class LogsController < ApplicationController
  def create
    log = Log.new(log_params)
    if log.save
      render nothing: true, status: :ok
    else
      render nothing: true, status: :unprocessable_entity
    end
  end

  private

  def log_params
    params.require(:log).permit(
      :object_type,
      :object_id,
      :author_id,
      :action,
      :serialized_object => {},
      :extras => {}
    )
  end
end
