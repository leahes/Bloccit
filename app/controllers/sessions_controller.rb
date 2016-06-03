class SessionsController < ApplicationController
  def new
   end

   def create

     user = User.find_by(email: params[:session][:email].downcase)


     if user && user.authenticate(params[:session][:password])
       create_session(user)
       flash[:notice] = "Welcome, #{user.name}!"
       redirect_to root_path
     else
       flash.now[:alert] = 'Invalid email/password combination'
       render :new
     end
   end

   def destroy
     destroy_session(current_user)
     flash[:notice] = "You've been signed out, come back soon!"
     redirect_to root_path
   end

    describe "DELETE sessions/id" do
      it "render the #welcome view" do
        delete :destroy, id: my_user.id
        expect(response).to redirect_to root_path
      end

      it "deletes the user's session" do
        delete :destroy, id: my_user.id
        expect(assigns(:session)).to be_nil
      end

      it "flashes #notice" do
        delete :destroy, id: my_user.id
        expect(flash[:notice]).to be_present
      end
    end
end
