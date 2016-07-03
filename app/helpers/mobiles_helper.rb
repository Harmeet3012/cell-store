module MobilesHelper
    def disp_message
        user = User.find session[:user_id]
        user.email
    end
end
