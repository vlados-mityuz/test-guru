document.addEventListener('turbolinks:load', function() {
    let control = document.querySelector('.progress-bar')

    if (control) {
        showProgressBar(control)
    }
})

function showProgressBar(control) {
    control.setAttribute('value', `${control.dataset.value}`)
    control.setAttribute('max', `${control.dataset.max}`)
}