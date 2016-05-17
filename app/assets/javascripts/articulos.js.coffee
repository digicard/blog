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
      		  '<td class="campo-titulo">'+element['titulo']+'</td>'+
      		  '<td class="campo-texto">'+element['texto']+'</td>'+
      		  '<td class="campo-usuario">'+element['usuario_id']+'</td>'+
      		  '<td><button id="'+element['id']+'" class="button-edit btn btn-default">Editar</button></td>'+
      		  '<td><button class="btn btn-default">Borrar</button></td>'+
      		  '</tr>'
      	  $('tbody.contenido').append(art)

$ ->
  $(document).on "click", ".button-edit", (e)->
    id_art = $(@).attr 'id'
    art = [ $('tr[id="'+id_art+'"] .campo-titulo').html()
              $('tr[id="'+id_art+'"] .campo-texto').html(),
              $('tr[id="'+id_art+'"] .campo-usuario').html() ]
    $('tr[id="'+id_art+'"] td').addClass( 'td_oculto' )
    $('tr[id="'+id_art+'"]').append( '<td colspan="3">'+$('.form_edit').html()+'</td>' )
    $('tr[id="'+id_art+'"] #tit_art').val( art[0] )
    $('tr[id="'+id_art+'"] #txt_art').val( art[1] )
    $('tr[id="'+id_art+'"] .usu_art').html( art[2] )
    ruta = $('#ruta_api_edit').val()
    ruta = ruta.replace("id", id_art)
    $('tr[id="'+id_art+'"] .form_tag_edit').attr( 'action' , ruta )


$ ->
  $(document).on "click", ".btn-edit-art", (e)->
    form = $(@).parent()
    ruta = form.attr("action")
    id_art = ruta.substring(13)
    $.ajax ruta,
      type : 'PUT',
      data: { art : { titulo: form.find('#tit_art').val() , texto: form.find('#txt_art').val() } },
      dataType: 'json',
      success: (data) ->
        td = form.parent()
        td.remove()
        $('tr[id="'+id_art+'"] .campo-titulo').html( data['titulo'] )
        $('tr[id="'+id_art+'"] .campo-texto').html( data['texto'] )
        $('tr[id="'+id_art+'"] td').removeClass( 'td_oculto' )
      error: (data) ->
        alert("Usted no puede modificar este articulo.")

$ ->
  $(document).on "click", ".btn-cancel-art", (e)->
    form = $(@).parent()
    td = form.parent()
    ruta = form.attr("action")
    id_art = ruta.substring(13)
    td.remove()
    $('tr[id="'+id_art+'"] td').removeClass( 'td_oculto' )
    