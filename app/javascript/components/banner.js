import Typed from 'typed.js';

const loadDynamicBannerText = () => {
  new Typed('#banner-typed-text', {
    strings: ["Save your local bar", "Support now!"],
    typeSpeed: 50,
    loop: true
  });
}

export { loadDynamicBannerText };
