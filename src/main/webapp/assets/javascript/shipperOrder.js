var list = document.querySelector("#Table");
var shipper = document.querySelector("#idUser")
var nameShipper = {
     "shipper": {
     	"users_id": shipper.value,
   	}
} 


function orderUnconfirmed() {
	fetch('http://localhost:8088/order/Unconfirmed', {
		method: 'GET',
		headers: {
			'Content-Type': 'application/json',
		},
	})
		.then(function(res) {
			return res.json();
		})
		.then((data) => {
			data.map((value)=>{
				$(list).append(`
				<tr>
                    <td>${value.user.users_first_name}</td>
                    <td>${value.address}</td>
                    <td>${value.phone}</td>
                    <td>${value.createAt}</td>
                    <td>${value.priceTotal}</td>
                    <td>Chưa nhận</td>
                    <td><a onclick="editStatus(${value.id})" class="btn btn-success btn-circle"><i class="fas fa-check"></i></a></td>
                </tr>
				`);
			});
		});
}

orderUnconfirmed()

function editStatus(id) {
	fetch('http://localhost:8088/order/?idOrder=' + id, {
		method: 'PUT',
		headers: {
			'Content-Type': 'application/json',
		},
		body: JSON.stringify(nameShipper),
	})
		.then(function(res) {
			window.location.href='http://' + window.location.host + '/WebBanHang/admin-shipper'
			return res.json()
		})
		.then((data) => {
			console.log(data)
			alert("Nhận đơn hàng thành công!!!");
		});
}