var idUser = document.querySelector('#idUser')
var IDUser = idUser.defaultValue


function start(id) {
	var apiURL = 'http://localhost:8088/product/store/' + id
	getOrderInfo(function(data) {
		renderOrderinfo(data)
	}, apiURL);
}

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
			start(data.id);
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
		var disconutinue = ""
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
							<td><a class="btn btn-warning btn-circle js-btn-editBook"><i class="fa-regular fa-pen-to-square"></i></a></td>
                            <td><a id="deletePd" class="btn btn-danger btn-circle"><i class="fas fa-trash"></i></a></td>
                        </tr>                                      
			`);
	}
	);

}

let cbb = []
function fetchCbb() {
	fetch('http://localhost:8088/category', {
		method: 'GET',
		headers: {
			'Content-Type': 'application/json',
		},
	})
		.then(function(res) {
			return res.json();
		})
		.then((data) => {
			data.map(function(value) {
				var text = `<option value='${value.categoryId}'>${value.categoryName}</option>`
				cbb.push(text)
			})
		});
}
fetchCbb()

var pd = {
	"id": 0,
	"productName": "",
	"image": "",
	"description": "",
	"price": 1000,
	"discontinued": 1,
	"id_discount": 1,
	"cover_id": 1,
	"store": {
		"id": IDUser
	},
	"category": {
		"categoryId": 1,
		"categoryName": "Sách tiếng Việt"
	},
	"quantity": 1,
	"id_NXB": 8
}
let oneProduct = {}
setTimeout(function() {
	const addBtn = document.querySelector('.js-btn-addBook')
	const editBtns = document.querySelectorAll('.js-btn-editBook')
	const modal = document.querySelector('.js-modal')

	const deletePds = document.querySelectorAll('#deletePd')
	for (const deletePd of deletePds) {
		deletePd.addEventListener('click', function() {
			if (confirm("Xác nhận xóa!") == true) {
				var idPd = deletePd.parentNode.parentNode.childNodes.item(1).innerHTML
				fetch('http://localhost:8088/product/' + idPd, {
					method: 'DELETE',
					headers: {
						'Content-Type': 'application/json',
					},
				})
					.then(function(res) {
						window.location.href = 'http://' + window.location.host + '/WebBanHang/vendor-produce'
						return res.json();
					})
					.then((data) => {

					});
			}

		})
	}





	function showFormAddBook() {
		modal.classList.remove('product');
	}



	addBtn.addEventListener('click', function() {
		showFormAddBook()

		showForm(pd)
	})

	for (const editBtn of editBtns) {

		editBtn.addEventListener('click', function() {
			var idPd = editBtn.parentNode.parentNode.childNodes.item(1).innerHTML
			fetch('http://localhost:8088/product/' + idPd, {
				method: 'GET',
				headers: {
					'Content-Type': 'application/json',
				},
			})
				.then(function(res) {
					return res.json();
				})
				.then((data) => {
					showForm(data)
				});

			showFormAddBook()
		})
	}


}, 500);



function showForm(oneProduct) {
	var op = ""
	cbb.forEach(function(value) {
		op += value
	})
	var editPd = document.querySelector("#editPd")
	var text = `<form class="col-lg-6 modal_container">
                <i class="fa-solid fa-x icon-X js-btn-close"></i>
                <div class="mb-3 form_text modal_body col-lg-12">
                    <span class="text_title">Tên sách</span>
                    <input type="text" class="form-control " id="nameBook" placeholder="" value="${oneProduct.productName}" required>
                </div>

                <div class="mb-3 form_text col-lg-12">
                    <span class="text_title">Thể loại</span>
                    <select class="form-control" name="" id="opCate">
                    	<option value="${oneProduct.category.categoryId}" selected>${oneProduct.category.categoryName}</option>
                        ${op}
                    </select>
                </div>

                <div class="mb-3 form_text col-lg-12">
                    <span class="text_title">Mô tả</span>
                    <textarea id="description" class="form-control" rows="3" required>${oneProduct.description}</textarea>
                </div>

                <div class="mb-3 form_text col-lg-12">
                    <span class="text_title">Giá</span>
                    <input type="number" class="form-control " id="price" placeholder="" value="${oneProduct.price}" required>
                </div>

                <div class="mb-3 form_text col-lg-12">
                    <span class="text_title">Số lượng</span>
                    <input type="number" class="form-control " id="quantity" placeholder="" value="${oneProduct.quantity}" required>
                </div>

                <div class="mb-3 form_text col-lg-12">
                    <span class="text_title" style="margin-right: 16px;">Ảnh</span>
                    <input type="text" class="form-control " id="image" placeholder="" value="${oneProduct.image}" required>
                    
                </div>
    
                <div class="mb-3 form_btn--save footer col-lg-12">
                    <span class="col-lg-2"></span>
                    <button class="btn-pri my-2 my-sm-0 btn-lg btn-block btn-save" type="submit"
                       id="btnSubmit">Lưu</button>
                </div>
            </form>`
	editPd.innerHTML = text

	const modal = document.querySelector('.js-modal')
	function hideFormAddBook() {
		modal.classList.add('product');
	}
	const closeBtn = document.querySelector('.js-btn-close')
	closeBtn.addEventListener('click', hideFormAddBook)



	var nameBook = document.querySelector("#nameBook")
	nameBook.addEventListener('change', function(e) {
		oneProduct.productName = e.target.value
	})

	var opCate = document.querySelector("#opCate")
	opCate.addEventListener('change', function(e) {
		oneProduct.category.categoryId = e.target.value
	})

	var description = document.querySelector("#description")
	description.addEventListener('change', function(e) {
		oneProduct.description = e.target.value
	})

	var price = document.querySelector("#price")
	price.addEventListener('change', function(e) {
		oneProduct.price = e.target.value
	})

	var quantity = document.querySelector("#quantity")
	quantity.addEventListener('change', function(e) {
		oneProduct.quantity = e.target.value
				
	})

	var image = document.querySelector("#image")
	image.addEventListener('change', function(e) {
		oneProduct.image = e.target.value
	})

	var btnSubmit = document.querySelector("#btnSubmit")
	btnSubmit.addEventListener('click', function(e) {
		if(oneProduct.productName != "" && oneProduct.image != "" && oneProduct.description != ""){
			fetch('http://localhost:8088/product/addOrEdit', {
			method: 'POST',
			headers: {
				'Content-Type': 'application/json',
			},
			body: JSON.stringify(oneProduct),
		})
			.then(function(res) {
				window.location.href = 'http://' + window.location.host + '/WebBanHang/vendor-produce'
				return res.json();
			})
			.then((data) => {
				alert("Cập nhật thành công!!!")
				hideFormAddBook()
			});
		}
		
	})
}

