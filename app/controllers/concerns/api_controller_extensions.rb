module ApiControllerExtensions
  extend ActiveSupport::Concern

  included do
    respond_to :api_v1, :html
    #before_filter :check_accept_header
  end

  def check_accept_header
    unless request.format == :api_v1
      render :nothing => true, :status => 406
    end
  end

  def api_not_found
    render :nothing => true, :status => 404
  end

  def api_forbidden(msg = nil)
    if msg.present?
      render :json => [I18n.t(msg)], :status => 403
    else
      render :nothing => true, :status => 403
    end
  end

  def api_unprocessable_entity
    render :nothing => true, :status => 422
  end

  def api_unprocessable_entity_with_errors(object)
    render :json => ErrorsSerializer.new(object).serialize, :status => 422
  end

  def default_serializer_options
    {root: false}
  end

end