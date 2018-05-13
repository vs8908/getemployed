module Admin
  class BaseController < ApplicationController
    before_action :check_admin_user

    def check_admin_user
      return true if current_user && current_user.admin
      redirect_to root_path
    end
  end
end