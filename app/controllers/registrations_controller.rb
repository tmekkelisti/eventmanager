class RegistrationsController < Devise::RegistrationsController
  protected

  def sign_up_params
    params.require(:user).permit(:username, :password,
      :password_confirmation)
  end
end
