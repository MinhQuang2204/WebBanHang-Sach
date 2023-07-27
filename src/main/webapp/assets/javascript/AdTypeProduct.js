var cateTable = document.querySelector("#idCateTable")

function getAllCate() {
	fetch('http://localhost:8088/category/all', {
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
				$(cateTable).append(`
				<tr>
	                <td>${value.categoryId}</td>
	                <td>${value.categoryName}</td>
	                <td><a id="editCate" class="btn btn-warning btn-circle"><i
	                            class="fa-regular fa-pen-to-square"></i></a></td>
	                <td><a id="delCate" class="btn btn-danger btn-circle"><i
	                            class="fas fa-trash"></i></a></td>
	            </tr>`)
			})
		});
}

getAllCate()
var currentDate = new Date().toJSON().slice(0, 10);

var cate = {
	"categoryId": 0,
	"categoryDescription": "",
	"categoryImage": "",
	"categoryName": "",
	"createAt": currentDate,
	"parentId": 0,
	"updateAt": currentDate
}

setTimeout(function() {
	const addBtn = document.querySelector('.js-btn-addTypeBook')
	const editBtn = document.querySelectorAll('#editCate')
	const modal = document.querySelector('.js-modal')
	const closeBtn = document.querySelector('.js-btn-close')
	var nameTypeBook = document.querySelector("#nameTypeBook")
	
	nameTypeBook.addEventListener('change', function(e){
		cate.categoryName = e.target.value
	})
	
	editBtn.forEach(function(value) {
		value.addEventListener('click', function() {
			cate.categoryId = value.parentNode.parentNode.childNodes.item(1).innerHTML
			nameTypeBook.value = value.parentNode.parentNode.childNodes.item(3).innerHTML
			showFormAddTypeBook()
		})
	})
	
	var delBtn = document.querySelectorAll("#delCate")
	delBtn.forEach(function(value) {
		value.addEventListener('click', function() {
			cate.categoryId = value.parentNode.parentNode.childNodes.item(1).innerHTML
			delCate()
		})
	})

	function showFormAddTypeBook() {
		modal.classList.remove('type_product');		
	}

	function hideFormAddTypeBook() {
		modal.classList.add('type_product');
	}

	addBtn.addEventListener('click', function() {
		cate.categoryId = 0
		nameTypeBook.value = ""
		showFormAddTypeBook()
	})
	
	var btnLuu = document.querySelector("#btnLuu")
	btnLuu.addEventListener('click', function(){
		addOrEdit()
	})

	closeBtn.addEventListener('click', hideFormAddTypeBook)
}, 500)

function delCate() {
	if (confirm("Xác nhận xóa!") == true) {
		fetch('http://localhost:8088/category', {
		method: 'DELETE',
		headers: {
			'Content-Type': 'application/json',
		},
		body: JSON.stringify(cate),
	})
		.then(function(res) {
			
			window.location.href = 'http://' + window.location.host + '/WebBanHang/admin-typeProduct'
			
			return res.json();
		})
		.then((data) => {
			alert("Xóa thành công!!!")
			console.log(data)
		});
	}
}

function addOrEdit() {
	if(cate.categoryName != ""){
		fetch('http://localhost:8088/category/addOrEdit', {
		method: 'POST',
		headers: {
			'Content-Type': 'application/json',
		},
		body: JSON.stringify(cate),
	})
		.then(function(res) {
			
			window.location.href = 'http://' + window.location.host + '/WebBanHang/admin-typeProduct'
			
			return res.json();
		})
		.then((data) => {
			alert("Cập nhật thành công!!!")
			console.log(data)
		});
	}
}