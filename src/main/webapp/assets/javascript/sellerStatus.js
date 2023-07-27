function start(statusId, id, idStore) {
	var apiURL = 'http://localhost:8088/order/?idStore=' + idStore + '&idStatus=' + statusId
	getOrderInfo(function(data) {
		renderOrderinfo(data, id)
	}, apiURL);
}

var idUser = document.querySelector('#idUser')
var IDUser = idUser.defaultValue


function getIdstore() {
	fetch('http://localhost:8088/store/?idUser=' + IDUser, {
		method: 'GET',
		headers: {
			'Content-Type': 'application/json',
		}
	})
		.then(function(res) {
			return res.json();
		})
		.then((data) => {
			start(1, '#Table', data.id);
			setTimeout(function() {
				start(2, '#Table', data.id);
				start(3, '#Table', data.id);
				start(4, '#Table', data.id);
			}, 100)
		});
}
getIdstore()



function getOrderInfo(callback, apiURL) {
	fetch(apiURL, {
		method: 'GET',
		headers: {
			'Content-Type': 'application/json',
		}
	})
		.then(function(res) {
			return res.json();
		})
		.then(callback);
}

function renderOrderinfo(data, id) {
	var list = document.querySelector(id);


	var info_product = data.map((value) => {
		return {
			createAt: value.createAt,
			address: value.address,
			orderID: value.id,
			user: value.user,
			phone: value.phone,
			status: value.orderStatus,
			priceTotal: value.priceTotal,
			shipper: value.shipper
		};
	});

	info_product.map(function(items) {
		var shipperName = ''
		if (items.status.id == 3 || items.status.id == 4)
			shipperName = items.shipper.users_last_name + ' ' + items.shipper.users_first_name
		else if (items.status.id == 2 && items.shipper != null)
			shipperName = items.shipper.users_last_name + ' ' + items.shipper.users_first_name

		var formatSum = items.priceTotal.toLocaleString('it-IT', { style: 'currency', currency: 'VND' });

		if (items.status.statusName == 'Chờ xác nhận') {
			$(list).append(`                                
             <tr>
               <input type="hidden" value="${items.orderID}"/>
               <td>${items.user.users_first_name} ${items.user.users_last_name}</td>
               <td>${items.address}</td>
               <td>${items.phone}</td>
               <td>${items.createAt}</td>
               <td>${formatSum}</td>
               <td>${items.status.statusName}</td>
               <td>${shipperName}</td>      
               <td><a class="btn btn-warning btn-circle js-btn-view"><i class="fa-regular fa-file"></i></a></td>
               <td><a onclick="editStatus(${items.orderID}, 2)" class="btn btn-success btn-circle"><i class="fas fa-check"></i></a></td>
               <td><a onclick="editStatus(${items.orderID}, 4)" class="btn btn-danger btn-circle"><i class="fas fa-trash"></i></a></td>                                        
             </tr>                                       
		`);
		}
		else {
			$(list).append(`                                
             <tr>
               <input type="hidden" value="${items.orderID}"/>
               <td>${items.user.users_first_name} ${items.user.users_last_name}</td>
               <td>${items.address}</td>
               <td>${items.phone}</td>
               <td>${items.createAt}</td>
               <td>${formatSum}</td>
               <td>${items.status.statusName}</td>
               <td>${shipperName}</td>      
               <td><a class="btn btn-warning btn-circle js-btn-view"><i class="fa-regular fa-file"></i></a></td>
               <td></td>
               <td></td>                                        
             </tr>                                       
		`);
		}


	}
	);

}

setTimeout(function() {
	const viewBtns = document.querySelectorAll('.js-btn-view')
	const modal = document.querySelector('.js-modal')
	const closeBtn = document.querySelector('.js-btn-close')
	
	function showFormOrderDetails(id) {
		modal.classList.remove('product');
		showFormProduct(id)
	}

	function hideFormOrderDetails() {
		modal.classList.add('product');
	}

	for (const viewBtn of viewBtns) {
		viewBtn.addEventListener('click', function() {
			showFormOrderDetails(viewBtn.parentNode.parentNode.childNodes.item(1).value)
		})
	}

	closeBtn.addEventListener('click', hideFormOrderDetails)
}, 500)

function showFormProduct(id) {
	var listPd = document.querySelector("#listPd")
	text = ``
	fetch('http://localhost:8088/orderDetail/productOfOrder?idOrder=' + id, {
		method: 'GET',
		headers: {
			'Content-Type': 'application/json',
		},
	})
		.then(function(res) {
			return res.json()
		})
		.then((data) => {
			data.map(value => {
				text += `<tr>
			            <td>${value.product.productName}</td>
			            <td>${value.quantiry}</td>
			            <td>${value.totalPrice}</td>
			        </tr>`
			})
			listPd.innerHTML = text
		});

	
}

function editStatus(id, idStatus) {
	fetch('http://localhost:8088/order/' + id, {
		method: 'PUT',
		headers: {
			'Content-Type': 'application/json',
		},
		body: JSON.stringify({
			"orderStatus": {
				"id": idStatus
			}
		}),
	})
		.then(function(res) {
			window.location.href = 'http://' + window.location.host + '/WebBanHang/vendor-orderForm'
			return res.json()
		})
		.then((data) => {
			console.log(data)
			alert("Thành công!!!");
		});
}

function deleteStatus(id) {
	fetch('http://localhost:8088/order/' + id, {
		method: 'PUT',
		headers: {
			'Content-Type': 'application/json',
		},
		body: JSON.stringify({
			"orderStatus": {
				"id": 4
			}
		}),
	})
		.then(function(res) {
			window.location.href = 'http://' + window.location.host + '/WebBanHang/vendor-orderForm'
			return res.json()
		})
		.then((data) => {
			console.log(data)
			alert("Thành công!!!");
		});
}