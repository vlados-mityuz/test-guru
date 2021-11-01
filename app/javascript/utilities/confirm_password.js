document.addEventListener("turbolinks:load", function () {
 	var control = document.getElementById('user_password_confirmation')


 	if (control) { control.addEventListener("keyup", sortRowsByTitle) }
})

function checkMatching(){
 	var password = document.getElementById('user_password')
 	var confirm_password = document.getElementById('user_password_confirmation')
 	var succeed_sign = document.querySelector('.octicon-check')
	var failed_sign = document.querySelector('.octicon-x')

	if ((!this.value.length)) {
		succeed_sign.classList.add('hide')
		failed_sign.classList.add('hide')
		return
	}

	if (this.value === password.value) {
		succeed_sign.classList.remove('hide')
		failed_sign.classList.add('hide')
		return
	}

	else {
		succeed_sign.classList.add('hide')
		failed_sign.classList.remove('hide')
		return
	}
}