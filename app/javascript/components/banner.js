import Typed from 'typed.js';

function loadDynamicBannerText() {
  if (document.getElementById('banner-typed-text')) {
    new Typed('#banner-typed-text', {
      strings: ["Welcome to Gimme Shelter", "Book a bed for someone in need today."],
      typeSpeed: 60,
      loop: false
    });
  }
}

export { loadDynamicBannerText };


// <p>Welcome to Gimme Shelter. We provide a quick and effective way to book a hostel bed for those most in need.</p>
// <p>Give shelter to a homeless person today</p>
