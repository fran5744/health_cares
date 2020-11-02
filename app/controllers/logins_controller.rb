class LoginsController < ApplicationController
    def login
    end
  
    def login_check
      user = User.find_by(user_id: params[:user_id])
      if user && user.authenticate(params[:pass])
      # if user && user.password == params[:pass]
          # セッションのキー:user_idへユーザーのIDを登録
        session[:user_id] = user.user_id
        session[:authority] = user.authority
        redirect_to home_top_path
      else
        # flash変数にメッセージをセット
        flash.now.alert = "もう一度入力してください。"
        render "login"
      end
    end
  
    def logout
      reset_session
      flash[:notice] = 'ログアウトしました'
      redirect_to action: :login
    end
end
