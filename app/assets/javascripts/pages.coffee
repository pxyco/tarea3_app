# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

jQuery ->
  Morris.Line
    element: 'calories_chart'
    data: $('#calories_chart').data('posts')
    xkey: 'created_at',
    ykeys: ['calories_earned', 'calories_lost'],
    labels: ['Calories earned', 'Calories lost'],
    # lineColors: ['blue' , 'red'],
    xLabels: "day"