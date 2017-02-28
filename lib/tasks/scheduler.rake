desc "Intended for use on Heroku, re-crawls the newspaper websites"

task :update_stories => :environment do
  include StoryUpdater
  StoryUpdater.update
end
