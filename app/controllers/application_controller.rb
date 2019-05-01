class ApplicationController < ActionController::Base

    layout :layout_by_resource

    private 

    def layout_by_resource
        if devise_controller?
            "users"
        else
            "application"
        end
    end
end
