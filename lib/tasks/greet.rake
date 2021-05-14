#just a greet rake task
namespace :hello do
  desc 'Just a rake task to greet'
  task :process do
    puts 'hello , my first rake task'
  end
end