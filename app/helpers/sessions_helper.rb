module SessionsHelper
  def create_session(user)
<<<<<<< HEAD
     session[:user_id] = user.id
   end

 # #5
   def destroy_session(user)
     session[:user_id] = nil
   end

 # #6
   def current_user
     User.find_by(id: session[:user_id])
   end
=======
    session[:user_id] = user.id
  end

  def destroy_session(user)
    session[:user_id] = nil
  end

  def current_user
    User.find_by(id: session[:user_id])
  end
>>>>>>> checkpoint-38-work
end
