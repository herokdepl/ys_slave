class Api::BaseController < ApplicationController
  before_action :check_access_token
  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found
  rescue_from ActiveRecord::RecordInvalid, with: :record_invalid
  rescue_from ActionView::MissingTemplate, with: :missing_template

  private

  def check_access_token
    render nothing: true, status: :forbidden if params[:access_token] != 'toeknisko'
  end

  def record_not_found
    render nothing: true, status: :not_found
  end

  def record_invalid(exception)
    render json: {errors: exception.record.errors.to_hash}, status: :unprocessable_entity
  end

  def missing_template
    render nothing: true, status: :ok
  end
end
