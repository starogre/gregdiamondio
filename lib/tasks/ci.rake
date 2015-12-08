require 'rubocop/rake_task'

RuboCop::RakeTask.new

desc "Default CI task"
task ci: ['ci.default']

namespace :ci do
  task default: [:rubocop] do
  end

end
