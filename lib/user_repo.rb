require_relative './user'
require_relative './database_connection'

class UserRepo

  def create(username, password)
    
    DatabaseConnection.connect('chitter')

    params = [username, password]

    DatabaseConnection.exec_params('INSERT INTO users (username, email) VALUES ($1, $2)', params)

  end  

end  