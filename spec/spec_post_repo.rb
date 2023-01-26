require_relative '../lib/post'
require_relative '../lib/post_repo'

def reset_table
  seed_sql = File.read('seeds.sql')
  connection = PG.connect({ host: '127.0.01', dbname: 'chitter_test'})
  connection.exec(seed_sql)
end  

describe PostRepo do
  before(:each) do
    reset_table
  end

  it 'lists all posts' do
    post_repo = PostRepo.new
    posts = post_repo.all
    expect(posts[2].content).to eq('nothing to report so far, had a lie in')
    expect(posts[4].title).to eq('retirement update')
  end

  it 'adds a new post to the repo' do
    post_repo = PostRepo.new
    post = Post.new
    post.title = 'test'
    post.content = 'this is a test'
    post.time = '13:08'
    post.user_id = '1'
    post_repo.create(post)
    posts = post_repo.all
    expect(posts[-1].content).to eq('this is a test')
    expect(posts[-1].time).to eq('13:08:00')
  end  

end    