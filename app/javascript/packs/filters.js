const options = document.querySelectorAll('.dd-menu label')
options.forEach(option => {
  option.addEventListener('click', event => {
    option.classList.add('selected')
  })
})
