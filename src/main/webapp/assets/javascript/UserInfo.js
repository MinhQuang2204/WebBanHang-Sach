var name = document.querySelector("#firstNameChange")
var tel = document.querySelector("#telChange")
var add = document.querySelector("#textAddress")
var idUser = document.querySelector("#idUser")
var idPs = idUser.defaultValue

var json = {
	"users_phone": tel.defaultValue,
	"users_shipping_address": add.defaultValue
}

tel.addEventListener('change', function(e) {
	json.users_phone = e.target.value
})

add.addEventListener('change', function(e) {
	json.users_shipping_address = e.target.value
})

var btn = document.querySelector("#luu")
btn.addEventListener('click', function() {
	if (json.users_phone != '' && json.users_shipping_address != '') {
		fetch('http://localhost:8088/user/' + idPs, {
			method: 'PUT',
			headers: {
				'Content-Type': 'application/json',
			},
			body: JSON.stringify(json),
		})
			.then(function(res) {
				return res.json();
			})
			.then((data) => {
				console.log(data)
			});
	}
})