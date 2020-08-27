$(function () {
  $( document ).on( 'change', 'input', function(){ 
    const price = $( this ).val();
    const tax = price / 10;
    const profit = price - tax
    $('#add-tax-price').empty();
    $('#profit').empty();
    $('#add-tax-price').append(tax);
    $('#profit').append(profit);
  })
});