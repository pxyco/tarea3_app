# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

jQuery ->
  Morris.Line
    element: 'annual'
    data: [
      {y: '2012', a: 20}
      {y: '2011', a: 10}
      {y: '2010', a: 5}
      {y: '2009', a: 5}
      {y: '2008', a: 20}
    ]
    xkey: 'y',
    ykeys: ['a'],
    labels: ['Series A']
