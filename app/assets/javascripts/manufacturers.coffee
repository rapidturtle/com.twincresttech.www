jQuery ->
  $("#manufacturers").sortable
    handle: ".handle"
    update: ->
      $.post($(@).data("update-path"), $(@).sortable("serialize"))
