class Show < ActiveRecord::Base

    def self.highest_rating
        self.maximum("rating")
    end

    def self.most_popular_show
        self.where(highest_rating).take
    end

    def self.lowest_rating
        self.minimum('rating')
    end

    def self.least_popular_show
        # Could not use lowest_rating method.
        # Would return 10 as lowest number instead of 2
        self.order(rating: :asc).first
    end

    def self.ratings_sum
        self.sum('rating')
    end

    def self.popular_shows
        self.where("rating > 5")
    end

    def self.shows_by_alphabetical_order
        self.order(name: :asc)
    end
end
