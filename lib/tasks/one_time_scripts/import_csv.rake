require "csv"

namespace :import do
  desc "Import movies and reviews from CSV files"
  task movies: :environment do
    begin
      import_movies
      import_reviews
      puts "CSV import completed successfully."
    rescue => e
      puts "An error occurred: #{e.message}"
    end
  end

  def import_movies
    movies_file_path = Rails.root.join("lib/tasks/data/movies.csv")

    CSV.foreach(movies_file_path, headers: true) do |row|
      begin
        Movie.create!(
          name:             row["Movie"],
          description:      row["Description"],
          year:             row["Year"],
          director:         row["Director"],
          actor:            row["Actor"],
          country:          row["Country"],
          filming_location: row["Filming location"]
        )
      rescue => e
        puts "Failed to import movie: #{row['Movie']}, error: #{e.message}"
      end
    end
  end

  def import_reviews
    reviews_file_path = Rails.root.join("lib/tasks/data/reviews.csv")

    CSV.foreach(reviews_file_path, headers: true) do |row|
      begin
        movie = Movie.find_by(name: row["Movie"])
        if movie
          movie.reviews.create!(
            user:   row["User"],
            stars:  row["Stars"],
            review: row["Review"]
          )
        else
          puts "Movie not found for review: #{row['Movie']}"
        end
      rescue => e
        puts "Failed to import review for movie: #{row['Movie']}, error: #{e.message}"
      end
    end
  end
end
