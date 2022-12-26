module ApplicationCable
  class Connection < ActionCable::Connection::Base

    identified_by :current_author
    
    def connect
      self.current_author = find_current_user
    end
    
    def disconnect
      
    end
    
    protected
    def find_current_user
      if current_author = Author.find_by(id: cookies.signed[:author_id])
        current_author
      else
        reject_unauthorized_connection
      end
    end

  end
end
