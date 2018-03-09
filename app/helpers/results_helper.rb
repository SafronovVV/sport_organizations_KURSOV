module ResultsHelper
  def form_params
    params[:action] == 'new' ? {header: 'Создание результата', create_form: true, submit: 'Создать'}\
    : {header: 'Редактирование результата', submit: 'Обновить'}
  end
end
