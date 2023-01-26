require_relative '../lib/user'
require_relative '../lib/user_repo'

def reset_table
  seed_sql = File.read('seeds.sql')
  connection = PG.connect({ host: '127.0.0.1', dbname: 'chitter_test' })
  connection.exec(seed_sql)
end  

describe UserRepo do
  before(:each) do
    reset_table
  end

  it 'lists all users' do
    user_repo = UserRepo.new
    users = user_repo.all
    expect(users.length).to eq(10)
    expect(users[0].password).to eq('testing123')
  end  
end    