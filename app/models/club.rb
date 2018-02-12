class Club < ApplicationRecord
  belongs_to :sport_organization, optional: true
  belongs_to :sport

  enum club_type: { children: 0, youthful: 1, adult: 2 }
end
