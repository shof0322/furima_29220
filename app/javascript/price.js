$(function () {
  $( document ).on( 'change', 'input', function(){ 
    var price = $( this ).val();
    var tax = price / 10;
    var profit = price - tax
    $('#add-tax-price').empty();
    $('#profit').empty();
    $('#add-tax-price').append(tax);
    $('#profit').append(profit);
  })
});