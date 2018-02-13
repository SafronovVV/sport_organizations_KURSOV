class RequestDecorator < Draper::Decorator
  delegate_all

  def result_title
    participant.name + ' / ' + competition.name
  end
end
