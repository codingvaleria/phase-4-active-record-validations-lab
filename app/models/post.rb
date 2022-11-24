class Post < ApplicationRecord
    validates :title, presence: true
    validates :content, length:{ minimum: 250 }
    validates :summary, length:{ maximum: 250 }
    validates :category, inclusion: { in: ["Fiction", "Non-Fiction"]}
    validate  :is_clickbaity

    STRINGS = [/Secret/i, /Won't Believe/i, /Guess/i, /Top \d/i]
    def is_clickbaity
        if STRINGS.none? { |t| t.match title }
         errors.add(:title, "must be clickbait")
        end
  end

        
end
