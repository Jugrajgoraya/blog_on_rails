class UsersController < ApplicationController

    def new
        @user = User.new
    end
    def create
        @user  = User.new params.require(:user).permit(:name,:email,:password,:password_confirmation)
        if @user.save
            session[:user_id] = @user.id
            flash[:notice] = "user Signed Up"
            redirect_to posts_path
       else
        flash[:notice] = "couldn't create User"
           render :new
       end
    end
    def edit
        @user = User.find_by_id params[:id]        
    end
    def update
        @user = User.find_by_id params[:id] 
        if @user.update params.require(:user).permit(:name,:email)
            flash[:notice] = "User updated seccesfully"
            redirect_to root_path            
        else
            flash[:notice] = "Coudn't Update User!"
            render :edit
         end        
    end
    def destroy
        
    end
end
