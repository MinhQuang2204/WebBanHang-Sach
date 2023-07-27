var list = document.querySelector("#Table");
var shipper = document.querySelector("#idUser")
var idUser = shipper.value
function orderConfirmed(api) {
	fetch(api, {
		method: 'GET',
		headers: {
			'Content-Type': 'application/json',
		},
	})
		.then(function(res) {
			return res.json();
		})
		.then((data) => {
			data.map((value) => {
				if (value.orderStatus.statusName == 'Đang giao') {
					$(list).append(`
						<tr>
		                    <td>${value.user.users_first_name}</td>
		                    <td>${value.address}</td>
		                    <td>${value.phone}</td>
		                    <td>${value.createAt}</td>
		                    <td>${value.priceTotal}</td>
		                    <td>${value.orderStatus.statusName}</td>
		                    <td><a onclick="editStatus(${value.id})" class="btn btn-success btn-circle"><i class="fas fa-check"></i></a></td>
		                </tr>
					`);
				}
				else{
					$(list).append(`
						<tr>
		                    <td>${value.user.users_first_name}</td>
		                    <td>${value.address}</td>
		                    <td>${value.phone}</td>
		                    <td>${value.createAt}</td>
		                    <td>${value.priceTotal}</td>
		                    <td>${value.orderStatus.statusName}</td>
		                    <td></td>
		                </tr>
					`);
				}
			});
		});
}

orderConfirmed('http://localhost:8088/order/delivering/?idShipper=' + idUser)
orderConfirmed('http://localhost:8088/order/delivered/?idShipper=' + idUser)

function editStatus(id) {
	fetch('http://localhost:8088/order/' + id, {
		method: 'PUT',
		headers: {
			'Content-Type': 'application/json',
		},
		body: JSON.stringify({
			"orderStatus": {
				"id": 3
			}
		}),
	})
		.then(function(res) {
			window.location.href = 'http://' + window.location.host + '/WebBanHang/admin-shipOrder'
			return res.json()
		})
		.then((data) => {
			console.log(data)
			alert("Xác nhận đã giao thành công!!!");
		});
}