// script.js
function changeSlide(carouselContainer, n) {
    const carousel = carouselContainer.querySelector('.carousel');

    if (!carousel) {
        console.error('Carousel not found.');
        return;
    }

    const images = carousel.querySelectorAll('img');

    if (!images || images.length === 0) {
        console.error('No images found in the carousel.');
        return;
    }

    if (images.length === 1) {
        return; // Do nothing if there's only one image
    }

    let currentSlide = 0;
    const transformValue = window.getComputedStyle(carousel).getPropertyValue('transform');
    const matrix = new DOMMatrix(transformValue);
    currentSlide = Math.round(-matrix.m41 / carousel.clientWidth);

    currentSlide = (currentSlide + n + images.length) % images.length;

    carousel.style.transform = `translateX(${-currentSlide * 100}%)`;

    // Add a class to scale down the image if there is only one
    if (images.length === 1) {
        images[0].classList.add('single-image');
    } else {
        images[0].classList.remove('single-image');
    }
}
