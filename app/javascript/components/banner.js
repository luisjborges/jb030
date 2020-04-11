import Typed from 'typed.js';

const loadDynamicBannerText = () => {
  new Typed('#banner-typed-text', {
    strings: ["Save your local bar", "Scroll down to read our story."],
    typeSpeed: 50,
    loop: true
  });
}

export { loadDynamicBannerText };
