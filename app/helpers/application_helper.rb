module ApplicationHelper
  def last_modified_date
    DateTimeUtils.datetime_from_timestamp(params[:last_modified].nil? ? 0 : params[:last_modified].to_i)
  end

  # Метод permit при получении параметров удаляет ключи массивов, если массив пустой.
  # Но массивы используются для привязывания элементов через has_many.
  # Это сказывается на удалении всех связанных элементов, а точнее это невозможно,
  # так как ключ массива удаляется, и элементы не удаляются.
  # Данный метод возвращает копию параметров, в которых есть пустые массивы,
  # если они изначально приходили.
  # arrays_names = [:a, :b, :c]
  def restore_empty_arrays(fixed_params, raw_params, arrays_names)
    arrays_names.each do |name|
      fixed_params[name] ||= [] if raw_params.has_key?(name)
    end
    fixed_params
  end

  # Добавляет в список информацию о сущностях, которые нужно удалить.
  # Удалить нужно те, о которых информация не пришла.
  def add_delete_info(params_objects, current_objects = [])
    return nil if params_objects.nil?
    current_ids = (current_objects || []).map { |object| object.id }.compact
    params_ids = params_objects.map { |object| object[:id].is_a?(String) ? object[:id].to_i : object[:id] }.compact
    to_delete_attributes = (current_ids - params_ids).map { |current_id| { id: current_id, _destroy: 1 } }
    params_objects + to_delete_attributes
  end
end
