namespace :my_namespace do
  desc "TODO"

  task my_task2: :environment do
    filenames = Dir[Rails.root.join('app','assets','images','*')]

    filenames.each do |f|
       if File.directory? f
         category = Category.create(name: f.split('/').last)
         Dir[f + '/*'].each do |f2|
          pictire = category.pictures.build(title: f2.split('/').last )
          File.open(f2) do |file|
          pictire.avatar = file
          end
           pictire.save!
           p pictire.avatar.url
         end
       end
       p f
    end
  end
end
