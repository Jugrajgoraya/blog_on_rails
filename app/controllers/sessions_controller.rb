class SessionsController < ApplicationController

    def new

    end
    def create
        user = User.find_by_email params[:email]
       if user 
           session[:user_id] = user.id
           flash.notice = "user loged in!"
           redirect_to root_path, { notice: "logged in", status: 303  }
       else
           flash.alert = "Wrong email or password!"
           render :new, status: 303
       end
    end
    def destroy
        session[:user_id] = nil
        redirect_to root_path
        flash[:notice] = "logged Out succesfully!"
    end
end
