class ListemessagesController < ApplicationController

    def index
        @liste_msgs = Message.where(user_id: session[:user_id]).or(Message.where(receiver: session[:user_id])) 

        @array_uniq_user_email = []
        @array_uniq_receiver_email = []
        @array_uniq_all_email = []
        @liste_msgs.each do |liste_msg|
            # user_id donc le Sender
            # On les met dans un tableau @array_uniq_user_email
            @array_uniq_user_email.push(liste_msg.user.email)



            # receiver donc celui qui recoit le msg 
            # On recupere les emails avec @receiver_user_email
            # Puis on les met dans un tableau @array_uniq_receiver_email
            @receiver_user_email = User.find(liste_msg.receiver).email
            @array_uniq_receiver_email.push(@receiver_user_email)
        end

        @array_uniq_user_email.each do |user_email|
            @array_uniq_all_email.push(user_email)
        end

        @array_uniq_receiver_email.each do |receiver_email|
            @array_uniq_all_email.push(receiver_email)
        end

    end

end
