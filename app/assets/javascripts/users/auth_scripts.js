$(document).on('turbolinks:load', function() {
  $("#user_birthday").mask("00-00-0000", {
    placeholder: "__-__-____"
  });

  $(".session_form").submit(function (event) {
    event.stopPropagation();

    setLoginButtonDisabled(true);

    $.ajax({
      url: $(".session_form").attr("action"),
      data: convertFormDataToJSON($(".session_form")),
      type: $(".session_form").attr("method"),
      dataType: 'json',
      processData: false,
      contentType: false,
      success: function(result, textStatus, jqXHR) {
        setLoginButtonDisabled(false);
        // var data   = result.data;
        // var errors = result.errors;
        // if(result.success === true) {
        //   if(isPresent(data.message) && isPresent(data.title)) {
        //     callMessageDialog(true, data.title, [data.message]);
        //   }
        //   else {
        //     window.location.replace("/admin");
        //   }
        // }
        // else {
        //   callMessageDialog(false, errors.title, errors.errors);
        // }
      },
  	  error: function(jqXHR, textStatus, errorThrown) {
        setLoginButtonDisabled(false);
        // var respJson;
        // try {
        //   respJson = jQuery.parseJSON(jqXHR.responseText);
        //   respJson = respJson.errors;
        // } catch (err) {
        //
        // }
        // if(isPresent(respJson)) {
        //   callMessageDialog(false, respJson.title, respJson.errors);
        // }
        // else {
        //   callMessageDialog(false, "Ошибка", "Неопознанная ошибка на сервере");
        // }
      }
    });
    return false;
  });
});

function setLoginButtonDisabled(disabled) {
  $(".session_form input[type='submit']").attr("disabled", disabled);
}
