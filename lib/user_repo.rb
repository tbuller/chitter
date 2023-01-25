require_relative './user'
require_relative './database_connection'

class UserRepo

  def all

    DatabaseConnection.connect('chitter')

    sql = 'SELECT * FROM users'

    result = DatabaseConnection.exec_params(sql, [])

    users = []

    result.each do |record|
      user = User.new
      user.id = record['id'].to_i
      user.username = record['username']
      user.password = record['password']

      users << user

    end  

    return users

  end  

  def create(user)
    
    DatabaseConnection.connect('chitter')

    params = [user.username, user.password]

    DatabaseConnection.exec_params('INSERT INTO users (username, password) VALUES ($1, $2)', params)

  end  

end  