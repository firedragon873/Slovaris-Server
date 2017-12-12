$(document).on('turbolinks:load', function() {
  $("#user_birthday").mask("00-00-0000", {
    placeholder: "__-__-____"
  });

  $(".clickable_row").on("click", function () {
    navigateToUrl($(this).attr("navigation_url"));
  });

  $(".word_row").each(function(index) {
    addWordRowListners($(this));
  });

  $("#add_new_word").on("click", function() {
    var parentDiсt = $("#dictionary_id").val();
    $.ajax({
      url: "/dictionary/dictionaries/" + parentDiсt + "/new_word",
      type: "GET",
      success: function(result, textStatus, jqXHR) {
        $(".words_container").append(result);
        addWordRowListners($(".word_row").last());
      }
    });
  });

});

function addWordRowListners(row) {
  addDeleteRowListner(row);
  addSortListnersToTable(row.find(".translates_table"));

  row.find(".translates_table .translate_row").each(function() {
    addDeleteTranslateRowListner($(this));
  });

  var parentDiсt = $("#dictionary_id").val();
  row.find(".add_new_translate").on("click", function() {
    $.ajax({
      url: "/dictionary/dictionaries/" + parentDiсt + "/new_translate",
      type: "GET",
      success: function(result, textStatus, jqXHR) {
        row.find(".translates_table tbody").append(result);

        row.find(".translates_table tbody tr").each(function(index) {
          $(this).find(".position_field").html(index + 1);
        });

        addDeleteTranslateRowListner(row.find(".translates_table .translate_row").last());
      }
    });
  });

}

function addSortListnersToTable(table) {
  Sortable.create(table.find("tbody")[0], {
    animation: 150,
    scroll: true,
    handle: '.drag-handler',
    onUpdate: function (evt) {
      table.find("tbody tr").each(function(index) {
        $(this).find(".position_field").html(index + 1)
  		});
    }
  });
}

function addDeleteRowListner(row) {
  row.find(".delete_row").on("click", function() {
    row.remove();
  });
}

function addDeleteTranslateRowListner(row) {
  row.find(".delete_translate_row").on("click", function() {
    row.remove();
  });
}
