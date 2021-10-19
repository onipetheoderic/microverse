require 'rails_helper' # include in your RSpec file
require 'sidekiq/testing' #include in your Rspec file
Sidekiq::Testing.fake! #include in your RSpec file


RSpec.describe UsersWorker, type: :worker do
  describe 'testing worker' do
    it 'UsersWorker jobs are enqueued in the scheduled queue' do
      expect {
        UsersWorker.perform_async()
      }.to change(UsersWorker.jobs, :size).by(1)
    end
    
  end
end