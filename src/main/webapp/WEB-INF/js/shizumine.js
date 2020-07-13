$(function() {

});

// 删除确认
// *href 确认后转到的地址.
function show_confirm(href) {
	var r = confirm("确认要进行此操作吗?");
	if (r) {
		window.location.href = href;
	} else {
		return;
	}
}

function getJsonLength(jsonData) {
	var length = 0;
	for ( var ever in jsonData) {
		length++;
	}
	return length;
}

/*
 * 验证
 */

// 1、确认是否为中文
function isChinese(obj) {
	var reg = /^[\u0391-\uFFE5]+$/;
	if (obj != "" && !reg.test(obj)) {
		return false;
	}
	return true;
}

// 2、确认是否为英文
function isLetter(obj) {
	var reg = /^[a-zA-Z]*$/;
	if (obj != "" && !reg.test(obj)) {
		return false;
	}
	return true;
}

// 3、确认是否为数字
function isNumber(obj) {
	var reg = /^[0-9]+$/;
	if (obj != "" && !reg.test(obj)) {
		return false;
	}
	return true;
}

// 4、确认是否英文或数字
function isNumberAndLetter(obj) {
	var reg = /^[0-9a-zA-Z]+$/;
	if (obj != "" && !reg.test(obj)) {
		return false;
	}
	return true;

}

// 4、邮箱验证
function isEmail(obj) {
	// 对电子邮件的验证
	var myreg = /^([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+@([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+\.[a-zA-Z]{2,3}$/;
	if (!myreg.test(obj)) {
		return false;
	}
	return true;
}

// 5、手机验证
function isPhone(obj) {
	if (obj.length != 11) {
		return false;
	}
	var myreg = /^(((13[0-9]{1})|(15[0-9]{1})|(18[0-9]{1}))+\d{8})$/;
	if (!myreg.test(obj)) {
		return false;
	}
	return true;
}

/*
 * #验证结束
 */