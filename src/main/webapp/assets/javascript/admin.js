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

$(document).ready(function () {
    document.getElementById('pro-image').addEventListener('change', readImage, false);

    $(".preview-images-zone").sortable();

    $(document).on('click', '.image-cancel', function () {
        let no = $(this).data('no');
        $(".preview-image.preview-show-" + no).remove();
    });
});



var num = 4;
function readImage() {
    if (window.File && window.FileList && window.FileReader) {
        var files = event.target.files; //FileList object
        var output = $(".preview-images-zone");

        for (let i = 0; i < files.length; i++) {
            var file = files[i];
            if (!file.type.match('image')) continue;

            var picReader = new FileReader();

            picReader.addEventListener('load', function (event) {
                var picFile = event.target;
                var html = '<div class="preview-image preview-show-' + num + '">' +
                    '<div class="image-cancel" data-no="' + num + '">x</div>' +
                    '<div class="image-zone"><img id="pro-img-' + num + '" src="' + picFile.result + '"></div>' +
                    '</div>';

                output.append(html);
                num = num + 1;
            });

            picReader.readAsDataURL(file);
        }
        $("#pro-image").val('');
    } else {
        console.log('Browser not support');
    }
}

function changeToOrderManagementForm() {
    document.getElementById("product_management-form").classList.remove('active');
    document.getElementById("add_products-form").classList.remove('active');
    document.getElementById("order_management-form").classList.add("active");
}

function changeToProductManagementForm() {
    document.getElementById("add_products-form").classList.remove('active');
    document.getElementById("order_management-form").classList.remove('active');
    document.getElementById("product_management-form").classList.add("active");
}

function changeToAddProductsForm() {
    document.getElementById("order_management-form").classList.remove('active');
    document.getElementById("product_management-form").classList.remove('active');
    document.getElementById("add_products-form").classList.add("active");
}