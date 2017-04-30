# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
###
jQuery ->
  Stripe.setPublishableKey($('meta[name-"stripe-key"]').attr('content'))

  payment.setupForm()

payment = (
  setupForm: ->
    $('#new_payment').submit ->
      $('input[type=submit]').attr('disabled', true)
      payment.processCard()
      false

  processCard: ->
    card =(
      number: $('#card_number').val()
      cvc: $('#card_code').val()
      expMonth: $('#card_month').val()
      expYear: $('#card_year').val()
      )
    Stripe.createToken(card)


)
###
