import slick from 'slick-carousel'

document.addEventListener('DOMContentLoaded', () => {
  $('.carousel').slick({
    centerMode: true,
    centerPadding: '35px',
    arrows: false,
    mobileFirst: true,
    swipeAngle: false
  })
})

$('.carousel').on('afterChange', (event, slick, currentSlide) => {
  setTimeout(
    changeMapZoom(currentSlide),
    1000
  )
})
