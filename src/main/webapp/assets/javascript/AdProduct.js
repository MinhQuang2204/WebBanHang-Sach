


function start() {
	var apiURL = 'http://localhost:8088/product'
	getOrderInfo(function(data) {
		renderOrderinfo(data)
	}, apiURL);
}

start()

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

function renderOrderinfo(data) {
	var list = document.querySelector('#product');


	var info_product = data.map((value) => {
		return {
			id: value.id,
			name: value.productName,
			categoryName: value.category.categoryName,
			quantity: value.quantity,
			price: value.price,
			dis: value.discontinued
		};
	});

	info_product.map(function(items) {
		var formatSum = items.price.toLocaleString('it-IT', { style: 'currency', currency: 'VND' });
		if(items.dis == 1)
			disconutinue = "Còn bán"
		else
			disconutinue = "Dừng bán"
		$(list).append(`                                
                        <tr>
                            <td>${items.id}</td>
                            <td>${items.name}</td>
                            <td>${items.categoryName}</td>
                            <td>${items.quantity}</td>
                            <td>${formatSum}</td>
                            <td>${disconutinue}</td>
                            <td><a onclick="deletePd(${items.id})" class="btn btn-danger btn-circle"><i class="fas fa-trash"></i></a></td>
                        </tr>                                      
			`);
	}
	);

}

function deletePd(idPd) {
	if (confirm("Xác nhận xóa!") == true) {
		fetch('http://localhost:8088/product/' + idPd, {
			method: 'DELETE',
			headers: {
				'Content-Type': 'application/json',
			},
		})
			.then(function(res) {
				window.location.href = 'http://' + window.location.host + '/WebBanHang/admin-product'
				return res.json();
			})
			.then((data) => {

			});
	}
}