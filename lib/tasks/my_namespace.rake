namespace :my_namespace do
  desc "TODO"

  # task my_task1: :environment do
  # dirs = Dir[Rails.root.join('app','assets','images','*')]
  # dirs.each do |d|
  #   puts d
  # end



  task my_task2: :environment do
    filenames = Dir[Rails.root.join('app','assets','images','*')]

    filenames.each do |f|

       if File.directory? f

         category = Category.create(name: f.split('/').last)

         Dir[f + '/*'].each do |f2|

           #f3 = File.open(f2, "r")

          pictire = category.pictures.build(title: f2.split('/').last )
          File.open(f2) do |file|
          pictire.avatar = file
            #p file

          end
           pictire.save!
           p pictire.avatar.url
         end

      end

       p f

    end

#filenames.glob("**/*.{jpg,png}") {|f| puts f}
  end
end
