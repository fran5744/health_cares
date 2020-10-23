class LoginsController < ApplicationController
    def login
    end
  
    def login_check
      user = User.find_by(user_id: params[:user_id])
      if user && user.authenticate(params[:pass])
        # セッションのキー:user_idへユーザーのIDを登録
        session[:user_id] = user.user_id
        redirect_to home_top_path
      else
        # flash変数にメッセージをセット
        flash.now.alert = "もう一度入力してください。"
        render "login"
      end
    end
  
    def destroy
      session[:user_id] = nil
      @current_user = nil
      redirect_to login_path
    end
end