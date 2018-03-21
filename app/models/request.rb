class Request < ApplicationRecord
  belongs_to :participant, optional: true
  belongs_to :club, optional: true
  belongs_to :competition
  has_one :result, dependent: :destroy

  before_save :nullify_is_ill_for_clubs
  validate :validate_participant_or_club
  validates_uniqueness_of :participant_id, scope: [:competition_id], unless: :club_id?
  validates_uniqueness_of :club_id, scope: [:competition_id], unless: :participant_id?

  def validate_participant_or_club
    if !participant_id && !club_id
      errors.add("#{:participant_id} и #{:club_id}", 'не могут быть оба пустыми')
    end
    if participant_id && club_id
      errors.add('', 'Вы должны выбрать только одно')
    end
  end

  def nullify_is_ill_for_clubs
    self.is_ill = nil if club_id
  end
end
