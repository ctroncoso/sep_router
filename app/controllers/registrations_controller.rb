class RegistrationsController < Devise::RegistrationsController
  skip_filter :require_no_authentication, :only => [:new, :create]
  def new
    unless current_user.try(:admin)
      flash[:notice] = "Solo un administrador puede crear nuevos usuarios"
      redirect_to root_path
    else
      super
    end
  end

  def create
    super
  end
end
