module Admin
  class UsersController < Admin::BaseController
    before_action :set_user, only: %I[update]
    layout 'theme'

    def index
      @users = User.all
    end

    def update
      if @user.update(admin_user_attributes)
        flash[:notice] = 'User updated successfully.'
      else
        flash[:error] = 'Failed to update user.'
      end
      redirect_to admin_users_path
    end

    private

    def set_user
      @user = User.find(params[:id])
    end

    def admin_user_attributes
      params.require(:user).permit(:admin)
    end
  end
end
