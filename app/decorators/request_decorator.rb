class RequestDecorator < Draper::Decorator
  delegate_all

  def display_name
    if participant
      participant.decorate.short_info + ' / ' + competition.name
    elsif club
      club.decorate.short_info + ' / ' + competition.name
    end
  end

  def short_display_name
    if participant
      participant.name
    elsif club
      club.name
    end
  end
end
