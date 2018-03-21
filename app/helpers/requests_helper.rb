module RequestsHelper
  def yesno(boolean)
    return 'Да' if boolean == true
    return 'Нет' if boolean == false
    'Не указано'
  end
end
