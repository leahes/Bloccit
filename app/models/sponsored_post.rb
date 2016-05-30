class SponsoredPost < ActiveRecord::Base
  belongs_to :topics
end

# models are singular
# controllers, views and most routes are plural.
