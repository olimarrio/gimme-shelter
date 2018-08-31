import slick from 'slick-carousel'

document.addEventListener('DOMContentLoaded', () => {
  $('.carousel').slick({
    centerMode: true,
    centerPadding: '35px',
    arrows: false,
    mobileFirst: true
  })
})

$('.carousel').on('afterChange', (event, slick, currentSlide) => {
  console.log(currentSlide)
  changeMapZoom(currentSlide)
})
