jQuery ->
  $("#manufacturers").sortable
    handle: ".handle"
    update: ->
      $.post($(this).data("update-path"), $(this).sortable("serialize"))
