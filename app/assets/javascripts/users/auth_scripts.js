$(document).on('turbolinks:load', function() {
  $("#user_birthday").mask("00-00-0000", {
    placeholder: "__-__-____"
  });

  $(".session_form").submit(function (event) {
    event.stopPropagation();

    setSubmitButtonDisabled(true);

    $.ajax({
      url: $(".session_form").attr("action"),
      data: convertFormDataToJSON($(".session_form")),
      type: $(".session_form").attr("method"),
      dataType: 'json',
      processData: false,
      contentType: false,
      success: function(result, textStatus, jqXHR) {
        setSubmitButtonDisabled(false);
        var data   = result.data;
        var errors = result.errors;
        if(result.success === true) {
          window.location.replace("/");
        }
        else {
          alert(errors.join("\r\n"));
        }
      },
  	  error: function(jqXHR, textStatus, errorThrown) {
        setSubmitButtonDisabled(false);
        var respJson;
        try {
          respJson = $.parseJSON(jqXHR.responseText);
        } catch (err) {

        }
        if(isPresent(respJson)) {
          alert(respJson.errors.join("\r\n"));
        }
        else {
          alert("Неопознанная ошибка на сервере");
        }
      }
    });
    return false;
  });
});
