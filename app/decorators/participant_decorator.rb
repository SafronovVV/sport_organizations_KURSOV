class ParticipantDecorator < ApplicationDecorator
  delegate_all

  def short_info
    name + ' / ' + age.to_s + ' лет / ' + club_name
  end

  def club_name
    club.presence ? club.name : 'Не указано'
  end
end
