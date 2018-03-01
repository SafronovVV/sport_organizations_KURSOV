module ApplicationHelper

  def navigation_links
    [['Виды спорта', sports_path], ['Спорткомплексы', sport_complexes_path],
    ['Организации', sport_organizations_path], ['Клубы', clubs_path],
    ['Соревнования', competitions_path], ['Участники', participants_path],
    ['Заявки', requests_path], ['Результаты', results_path]]
  end
end
