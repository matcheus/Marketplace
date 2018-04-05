class ApplicationController < ActionController::Base
  layout :layout_by_resource

  # Layout per resource_name
  def layout_by_resource
    if devise_controller? && resource_name == :admin
      "devise_backoffice"
    else
      "application"
    end
  end
end
