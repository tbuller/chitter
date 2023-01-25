require_relative './user'
require_relative './database_connection'

class UserRepo

  def create(user)
    
    DatabaseConnection.connect('chitter')

    params = [user.username, user.password]

    DatabaseConnection.exec_params('INSERT INTO users (username, password) VALUES ($1, $2)', params)

  end  

end  