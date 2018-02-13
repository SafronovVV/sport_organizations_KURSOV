class RequestDecorator < Draper::Decorator
  delegate_all

  def result_title
    participant.decorate.short_info + ' / ' + competition.name
  end
end
