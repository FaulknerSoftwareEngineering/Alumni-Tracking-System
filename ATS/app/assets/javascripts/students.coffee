# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$ ->
 $("#Graduate_Degrees").click ->
  id = $('.hidden').html()
  $.ajax
   type: "get"
   url: "students/#{id}/grad_school"
   error: (jqXHR, textStatus, errorThrown) ->
     alert "Error"
   success: (data, textStatus, jqXHR) ->
     $('#table_div').html "#{data}"
 $("#Employment").click ->
  id = $('.hidden').html()
  $.ajax
   type: "get"
   url: "students/#{id}/employment"
   error: (jqXHR, textStatus, errorThrown) ->
     alert "Error"
   success: (data, textStatus, jqXHR) ->
     $('#table_div').html "#{data}"
      
    
    
    
    