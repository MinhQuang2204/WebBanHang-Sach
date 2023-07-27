	
function changeToProfileForm() {
    document.getElementById("changepass_form").classList.remove('active');
    document.getElementById("address_form").classList.remove('active');
    document.getElementById("order_form").classList.remove('active');
    document.getElementById("profile_form").classList.add("active");
}

function changeToAddressForm() {
    document.getElementById("changepass_form").classList.remove('active');
    document.getElementById("profile_form").classList.remove('active');
    document.getElementById("order_form").classList.remove('active');
    document.getElementById("address_form").classList.add("active");
}

function changeToChangepassForm() {
    document.getElementById("profile_form").classList.remove('active');
    document.getElementById("address_form").classList.remove('active');
    document.getElementById("order_form").classList.remove('active');
    document.getElementById("changepass_form").classList.add("active");
}

function changeToOrderForm() {
    document.getElementById("profile_form").classList.remove('active');
    document.getElementById("address_form").classList.remove('active');
    document.getElementById("changepass_form").classList.remove('active');
    document.getElementById("order_form").classList.add("active");
}



function changeToAllForm() {
    document.getElementById("shipping_form").classList.add('active');
    document.getElementById("shipped_form").classList.add('active');
    document.getElementById("cancel_form").classList.add('active');
    document.getElementById("waiting_form").classList.add('active');

    document.getElementById("item_typeOrder_shipping").classList.remove('active');
    document.getElementById("item_typeOrder_shipped").classList.remove('active');
    document.getElementById("item_typeOrder_cancel").classList.remove('active');
    document.getElementById("item_typeOrder_waiting").classList.remove('active');
    document.getElementById("item_typeOrder_all").classList.add("active");
}

function changeToWaitingForm() {
    document.getElementById("shipping_form").classList.remove('active');
    document.getElementById("shipped_form").classList.remove('active');
    document.getElementById("cancel_form").classList.remove('active');
    document.getElementById("all_form").classList.remove('active');
    document.getElementById("waiting_form").classList.add("active");

    document.getElementById("item_typeOrder_shipping").classList.remove('active');
    document.getElementById("item_typeOrder_shipped").classList.remove('active');
    document.getElementById("item_typeOrder_cancel").classList.remove('active');
    document.getElementById("item_typeOrder_all").classList.remove('active');
    document.getElementById("item_typeOrder_waiting").classList.add("active");
}

function changeToShippingForm() {
    document.getElementById("all_form").classList.remove('active');
    document.getElementById("shipped_form").classList.remove('active');
    document.getElementById("cancel_form").classList.remove('active');
    document.getElementById("waiting_form").classList.remove('active');
    document.getElementById("shipping_form").classList.add("active");

    document.getElementById("item_typeOrder_all").classList.remove('active');
    document.getElementById("item_typeOrder_shipped").classList.remove('active');
    document.getElementById("item_typeOrder_cancel").classList.remove('active');
    document.getElementById("item_typeOrder_waiting").classList.remove('active');
    document.getElementById("item_typeOrder_shipping").classList.add("active");
}

function changeToShippedForm() {
    document.getElementById("all_form").classList.remove('active');
    document.getElementById("shipping_form").classList.remove('active');
    document.getElementById("cancel_form").classList.remove('active');
    document.getElementById("waiting_form").classList.remove('active');
    document.getElementById("shipped_form").classList.add("active");

    document.getElementById("item_typeOrder_all").classList.remove('active');
    document.getElementById("item_typeOrder_shipping").classList.remove('active');
    document.getElementById("item_typeOrder_cancel").classList.remove('active');
    document.getElementById("item_typeOrder_waiting").classList.remove('active');
    document.getElementById("item_typeOrder_shipped").classList.add("active");
}

function changeToCancelForm() {
    document.getElementById("all_form").classList.remove('active');
    document.getElementById("shipped_form").classList.remove('active');
    document.getElementById("shipping_form").classList.remove('active');
    document.getElementById("waiting_form").classList.remove('active');
    document.getElementById("cancel_form").classList.add("active");
    
    document.getElementById("item_typeOrder_all").classList.remove('active');
    document.getElementById("item_typeOrder_shipping").classList.remove('active');
    document.getElementById("item_typeOrder_shipped").classList.remove('active');
    document.getElementById("item_typeOrder_waiting").classList.remove('active');
    document.getElementById("item_typeOrder_cancel").classList.add("active");
}