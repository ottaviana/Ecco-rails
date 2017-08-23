desc "Intended for use on Heroku, re-crawls the newspaper websites"

task :update_stories, [:name] => :environment do |t, args|
  include StoryUpdater
  StoryUpdater.update(args[:name])
end
