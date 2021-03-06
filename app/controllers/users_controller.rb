class UsersController < ApplicationController
  before_action :set_user, only: [:show, :update, :destroy]

  # GET /users
  def index
    @users = User.all

    render json: @users
  end

  # GET /users/1
  def show
    render json: @user
  end

  # POST /users
  def create
    @user = User.new(user_params)

    if @user.save
      render json: @user, status: :created, location: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /users/1
  def update
    if @user.update(user_params)
      render json: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # DELETE /users/1
  def destroy
    @user.destroy
  end

  def login
    @email = params[:email]
    @password = params[:password]
    
    if User.exists?(email: @email)
      @user = User.find_by(email: @email)
      if @password === @user.password
        render json: {
          status: 200,
          message: "Login feito com sucesso"
        }.to_json
      else
        render json: {
          status: 404,
          message: "Senha incorreta"
        }.to_json
      end
    else 
      render json: {
        status: 403,
        message: "Usuário não registrado!"
      }.to_json
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation, :is_logged)
    end
end
