class ClubDecorator < ApplicationDecorator
  delegate_all

  def short_info
    name + ' / ' + club_type + ' / ' + sport.name
  end
end
