class Charity
  attr_reader :name, :ein, :mission, :rating,
              :cause, :cause_img, :cause_id

  def initialize(data)
    @name = data[:charityName]
    @ein = data[:ein]
    @mission = data[:mission]
    @rating = data[:currentRating][:rating]
    @cause = data[:cause][:causeName]
    @cause_img = data[:cause][:image]
    @cause_id = data[:cause][:causeID]
  end
end
