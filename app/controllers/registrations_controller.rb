class RegistrationsController < Devise::RegistrationsController
  skip_filter :require_no_authentication, :only => [:new]
  def new
    unless current_user.try(:admin)
      flash[:notice] = "Solo un administrador puede crear nuevos usuarios"
      redirect_to root_path
    else
      super
    end
  end
end
