# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/



$ ->
  $(document).ready ->
    $.ajax $('#ruta_api').val(),
      type : "GET",
      success: (data) ->
        data.forEach (element,index) ->
      	  art = '<tr id="'+element['id']+'" >'+
      		  '<td>'+element['titulo']+'</td>'+
      		  '<td>'+element['texto']+'</td>'+
      		  '<td>'+element['usuario_id']+'</td>'+
      		  '<td><button id="'+element['id']+'" class="button btn btn-default">Editar</button></td>'+
      		  '<td><button class="btn btn-default">Borrar</button></td>'+
      		  '</tr>'
      	  $('tbody').append(art)