require_relative './post'

class PostRepo
  def all
    DatabaseConnection.connect('chitter')
    result = DatabaseConnection.exec_params('SELECT * FROM posts;', [])

    posts = []

    result.each do |record|
      post = Post.new
      post.id = record['id'].to_i
      post.title = record['title']
      post.content = record['content'] 
      post.time = record['time']
      post.user_id = record['user_id'].to_i

      post << posts
    end  

    return posts
  end  

  def create(title, content, time, user_id)
    sql = 'INSERT INTO posts (title, content, time, user_id) VALUES ($1, $2, $3, $4)'

    params = [title, content, time, user_id]

    DatabaseConnection.exec_params(sql, params)
  end  

end  