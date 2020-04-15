require("@rails/ujs").start()
require("@rails/activestorage").start()
require("channels")

import "bootstrap";

import { initUpdateNavbarOnScroll } from '../components/navbar';
initUpdateNavbarOnScroll();

import { loadDynamicBannerText } from '../components/banner';
loadDynamicBannerText();

document.addEventListener('turbolinks:load', () => {
  // Call your JS functions here
  initUpdateNavbarOnScroll();
});

document.addEventListener('turbolinks:load', function(event) {
  if (typeof gtag === 'function') {
    gtag('config', '<%= Rails.application.credentials.dig(:google_analytics) %>', {
      'page_location': event.data.url
    })
  }
})
