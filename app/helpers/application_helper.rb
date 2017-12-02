module ApplicationHelper
  def asset_data_base64(path)
    asset = Rails.application.assets.find_asset(path)
    throw "Could not find asset '#{path}'" if asset.nil?
    base64 = Base64.encode64(asset.to_s).gsub(/\s+/, "")
    "data:#{asset.content_type};base64,#{Rack::Utils.escape(base64)}"
  end

  def translated_errors_from_model(model)
    model.errors.collect do |error|
      class_name = "#{model.class}".underscore
      translated_key = I18n.t("activerecord.attributes.#{class_name}.#{error}")
      {translated_key => model.errors[error].first}
    end
  end

  # Унификация ответа от сервера
  def render_response(status, success, info, data, errors)
    render :status => status,
           :json => { :success => success,
                      :info => info,
                      :data => data,
                      :errors => errors }
  end

  # Отправляет ответ клиенту с данными, возвращенными в get_method.
  def simple_json_response(success_info, &get_method)
    get_method ||= lambda{ [] }

    begin
      render_response(200, true, success_info, get_method.call, {})
    rescue UserException => e
      render_response(200, false, e.message, e.data, e.object)
    rescue ActionController::ParameterMissing => e
      render_response(200, false, "Params error", nil, { e.param => ['parameter is required'] })
    rescue Exception => e
      puts e.message
      puts e.backtrace
      render_response(500, false, e.message, nil, {})
    end
  end

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
