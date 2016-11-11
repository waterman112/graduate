class UsersController < ApplicationController
  before_filter :authenticate_user!

  load_and_authorize_resource

  def index
  end

  def new
  end

  def create
    puts "this is users_controller_params___#{params}"
    puts "this is users_controller_create_action"
  end

  def show
    if @role.user.length == 0
      @assosciated_users = 'None'
    else
      @assosciated_users = @role.users.map(&:name).join(",")
    end
  end

  def edit
  end

  def update
    if user_params[:password].blank?
      user_params.delete(:password)
      user_params.delete(:password_confirmation)
    end

    successfully_updated = if needs_password?(@user,user_params)
                             @user.update(user_params)
                           else
                             @user.update_without_password(user_params)
                           end

    respond_to do |format|
      if successfully_updated
        format.html{redirect_to @user, notice: "user was successfully updated."}
        format.json{head :no_content}
      else
        format.html{render action: "edit"}
        format.json{render json:@user.errors, status: :unprocessable_entiry}

      end
    end
  end

  def destroy
  end

  protected
  def needs_password?(user, params)
    params[:password].present?
  end
  def user_params
    params.require(:user).permit(:email, :password,
           :password_confirmation, :name, :role_id)
  end
end
