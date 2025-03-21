let lastScrollY = 0;
const header = document.querySelector('.header');

window.addEventListener('scroll', () => {
    const currentScrollY = window.scrollY;

    if (currentScrollY > lastScrollY) {
        header.classList.add('hidden');
    } else {
        header.classList.remove('hidden');
    }

    lastScrollY = currentScrollY;
});
