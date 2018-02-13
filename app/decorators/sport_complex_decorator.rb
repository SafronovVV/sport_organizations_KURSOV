class SportComplexDecorator < ApplicationDecorator
  delegate_all

  def short_info
    name + ' / ' + address
  end
end
