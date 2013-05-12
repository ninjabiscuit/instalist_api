class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_filter :find_resource, :except => [:index, :new, :create]

  protected

    def find_resource
      instance_variable_set "@#{model_name}", model_class.find(params[:id])
    end

    def model_name
      params[:controller].singularize
    end

    def model_class
      model_name.camelize.constantize
    end
end
