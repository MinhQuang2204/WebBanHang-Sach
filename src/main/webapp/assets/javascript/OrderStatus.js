var idUser = document.querySelector("#idUser")
var idPs = idUser.defaultValue

function start(statusId, id) {
	var apiURL = 'http://localhost:8088/orderDetail/order/?idUser=' + idPs + '&idStatus=' + statusId
	getOrderInfo(function(data) {
		renderOrderinfo(data, id)
	}, apiURL);
}

start(1, '#waiting_form');
start(2, '#shipping_form');
start(3, '#shipped_form');
start(4, '#cancel_form');

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

	console.log(data);
	if (data.length == 0) {

		list.innerHTML = `<div class="no_order">
               <img class="img-no_order" src="./assets/img/no_order.png" alt="">
               <span class="titler-no_order">Chưa có đơn hàng</span>
      		</div>`
	}
	else {

		var info_product = data.map((value) => {
			return {
				product: value.product,
				amount: value.quantiry,
				status: value.order.orderStatus,
				totalPrice: value.totalPrice,
				order: value.order,
				priceTotal: value.order.priceTotal,
			};
		});

		var flag = 1;// flag = 1 thì thêm header statusName

		info_product.map(function(items, index, arr) {

			var formatPrice = items.totalPrice.toLocaleString('de-DE', { style: 'currency', currency: 'VND' });
			var formatSum = items.priceTotal.toLocaleString('de-DE', { style: 'currency', currency: 'VND' });

			if (index != arr.length - 1) {
				if (arr[index].order.id == arr[index + 1].order.id) {
					if (flag == 1) {
						$(list).append(`
						<div class="item_order"> 
							<div class="col-md-12 header_order">${items.status.statusName}</div>
							<div class="col-md-12 body_order">
								<div class="col-md-2">
									<img class="body_img"
										src="${items.product.image}"
										alt="">
								</div>
								<div class="col-md-10 body_content">
									<span class="content_item body_name">${items.product.productName}</span> 
									<span class="content_item body_quantity">x${items.amount}</span>
									<span class="content_item body_quantity">${formatPrice}</span>
								</div>
							</div>
							<div class="col-md-12 footer_order">
													
							</div>	
						</div>
					`)
						flag = 0;
					}
					else //flag != 1
					{
						$(list).append(`
						<div class="item_order"> 					
						<div class="col-md-12 body_order">
							<div class="col-md-2">
								<img class="body_img"
									src="${items.product.image}"
									alt="">
							</div>
							<div class="col-md-10 body_content">
								<span class="content_item body_name">${items.product.productName}</span> 
								<span class="content_item body_quantity">x${items.amount}</span>
								<span class="content_item body_quantity">${formatPrice}</span>
							</div>
						</div>
						<div class="col-md-12 footer_order">
												
						</div>	
					</div>
					`)
					}
				}

				else //index != index +1 
				{
					if (index == 0) {
						$(list).append(`
							<div class="item_order"> 
								<div class="col-md-12 header_order">${items.status.statusName}</div>
								<div class="col-md-12 body_order">
									<div class="col-md-2">
										<img class="body_img"
											src="${items.product.image}"
											alt="">
									</div>
									<div class="col-md-10 body_content">
										<span class="content_item body_name">${items.product.productName}</span>
										<span class="content_item body_quantity">x${items.amount}</span>
										<span class="content_item body_quantity">${formatPrice}</span>
									</div>
								</div>
								<div class="col-md-12 footer_order">
									<div class="footer_item">
										Tổng số tiền:
									<div class="total">${formatSum}</div>
								</div>						
							</div>							
					`)
					}
					else {
						$(list).append(`
						<div class="item_order"> 
							<div class="col-md-12 body_order">
								<div class="col-md-2">
									<img class="body_img"src="${items.product.image}"alt="">
								</div>
								<div class="col-md-10 body_content">
									<span class="content_item body_name">${items.product.productName}</span> 
									<span class="content_item body_quantity">x${items.amount}</span>
									<span class="content_item body_quantity">${formatPrice}</span>
								</div>
							</div>
							<div class="col-md-12 footer_order">
								<div class="footer_item">
									Tổng số tiền:
									<div class="total">${formatSum}</div>
								</div>					
							</div>	
						</div>`)
						flag = 1;
					}
				}
			}
			else //index = length - 1
			{
				$(list).append(
					`<div class="item_order"> 
						<div class="col-md-12 body_order">
							<div class="col-md-2">
								<img class="body_img" src="${items.product.image}"alt="">
							</div>
							<div class="col-md-10 body_content">
								<span class="content_item body_name">${items.product.productName}</span> 
								<span class="content_item body_quantity">x${items.amount}</span>
								<span class="content_item body_quantity">${formatPrice}</span>
							</div>
						</div>
						<div class="col-md-12 footer_order">
							<div class="footer_item">
								Tổng số tiền:
								<div class="total">${formatSum}</div>
							</div>					
						</div>	
					</div>`)

			}
		});

	}
}