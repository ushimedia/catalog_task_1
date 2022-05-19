class UsersController < ApplicationController
    
    def index
        @users = User.all
    end
    
    def new
        @user = User.new
    end

    def create
        @user = User.new #登録フォームの入力値
        if @user.save
          # ユーザ登録に成功した場合の処理
          redirect_to user_path(@user.id)
        else
          # ユーザ登録に失敗した場合の処理
          render :new
        end
    end

    def show
      @user = User.find(params[:id])
    end

    

    private

    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end

end
