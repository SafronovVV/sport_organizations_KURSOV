class ParticipantDecorator < ApplicationDecorator
  delegate_all

  def short_info
    name + ' / ' + age.to_s + ' лет / ' + club.name
  end
end
