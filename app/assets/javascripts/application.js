// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require jquery.mask.min
//= require moment
//= require moment-ru

$(document).on('turbolinks:load', function() {
});

function convertFormDataToJSON(htmlForm) {
  var formData  = new FormData();
  htmlForm.find("input, textarea, select").each(function(index) {
    var field = $(this)[0];
    if(field.type === "file") {
      if($(this)[0].files.length !== 0) {
        formData.append($(this).prop("name"), $(this)[0].files[0]);
      }
    }
    else if(field.type === "checkbox") {
      if($(this).prop("checked") === true) {
        formData.append(field.name, field.value);
      }
    }
    else {
      formData.append(field.name, field.value);
    }
  });

  return formData;
}

function navigateToUrl(url) {
  Turbolinks.visit(url);
}

function back() {
  window.history.go(-1);
}

function reloadPage() {
  window.location.reload(true);
}

function isPresent(value) {
  return value !== undefined && value !== null;
}

function isBlank(value) {
  return value === undefined || value === null;
}

function setSubmitButtonDisabled(disabled) {
  $("input[type='submit']").attr("disabled", disabled);
}
