var cookie = document.cookie;
function setItemsCookie(itemId,cartCount,qty){
    console.log(itemId.length);
    console.log("Setting Cookie");
    cookies = cookie.split(";");
    console.log(cookies);
    for(i = 0; i < cookies.length;i++){
      if (cookies[i].includes("item_"+itemId)){
        console.log(cookies[i]);
        cookieParams = cookies[i].split("=");
        qty = parseInt(qty) + parseInt(cookieParams[1]);
      }
    }
    document.cookie = "item_" + itemId + "=" + qty+";path=/";
    //document.cookie = "itemsInCart="+ cartCount +";path=/"
    cookie = document.cookie;
}

function addItemsToCookie(itemId,qty) {
    if (cookie != 0) {
        var cookies = cookie.split(";")
        nCookies = cookies.length;
    }
    else nCookies = 0;
    console.log(cookies);
    console.log(nCookies);
    if (nCookies == 0){
        setItemsCookie(itemId, 1, qty);
    }
    else{
        setItemsCookie(itemId, nCookies, qty);
    }
}

$('#addToCart').on('click', function(){
    itemId = $('#item').val();
    qty = $('#qty').val();
    console.log("Item: " + itemId, "Quantity: "  + qty);
    addItemsToCookie(itemId,qty);
    window.alert("Added to cart!");

});

function deleteCookie(itemId){
  var itemId = parseInt(itemId) + 1
  console.log("Deleting cookie: item_" + itemId)
  document.cookie = "item_" + itemId + '=;expires=Thu, 01 Jan 1970 00:00:01 GMT;';
  location.reload();
}

var enlargeThumbnails = function enlargeThumbnails(){
  $('#enlarged').click(function(){
    console.log($(this).src());
  })
}

console.log($('#addToCart'));
