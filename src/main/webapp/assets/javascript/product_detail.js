var count = document.querySelector("#quantity")
var checkAmount = document.querySelector("#checkAmount")

var amount = 1
count.addEventListener('change', function(e) {
	if(count.value <= checkAmount.value && count.value > 1){
		amount = e.target.value
		count.value = amount
		console.log(amount)
	}else
		count.value = 1
})

var plus = document.querySelector("#plus")
plus.addEventListener('click', function(e) {
	if(amount < checkAmount.value){
		amount = amount + 1
		count.value = amount
	}
})

var sub = document.querySelector("#sub")
sub.addEventListener('click', function(e) {
	if (amount > 1) {
		amount = amount - 1
		count.value = amount
	}
})



function buy(id) {
	$.ajax({
		url: "/WebBanHang/member/cart-add",
		type: "get", //send it through get method
		data: {
			pId: id,
			quantity: amount
		},
		success: function(data) {

		},
		error: function(xhr) {
			//Do Something to handle error
		}
	});
}