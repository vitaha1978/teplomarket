# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$(document).on "ready page:change", ->
  $('#main_presentation .col-md-3 > img').click ->
    $(this).parent().find(':submit').click()
    
$(document).on "ready page:change", ->
  $('.entry > img').click ->
    $(this).parent().find(':submit').click()
