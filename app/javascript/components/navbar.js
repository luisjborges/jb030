const initUpdateNavbarOnScroll = () => {
  const navbar = document.querySelector('.navbar-jb');
  if (navbar) {
    window.addEventListener('scroll', () => {
      if (window.scrollY >= window.innerHeight) {
        navbar.classList.add('navbar-jb-white');
      } else {
        navbar.classList.remove('navbar-jb-white');
      }
    });
  }
}

export { initUpdateNavbarOnScroll };
