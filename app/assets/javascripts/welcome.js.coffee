# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/


$ ->
  $(".ajax").click ->
    $.ajax "enviar_sumario_nuevos_usuarios",
      type : "GET",
      success: (data) ->
      	$(".alert").css("display","block")