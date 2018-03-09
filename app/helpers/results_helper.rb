module ResultsHelper
  def form_params
    params[:action] == 'new' ? {header: 'Создание результата', create_form: true}\
    : {header: 'Редактирование результата'}
  end
end
