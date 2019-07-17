class FlashCard < ApplicationRecord
  validates :prompt, presence: true,
                   length: { minimum: 5 }

  validates :answer, presence: true,
                    length: { minimum: 5 }
end
