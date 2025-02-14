// MUUTUJATE DEFINITSIOONID 
// jQuery viide vormile
const $form = $('.add-form__form');

// Taimede massiiv, mis hoiab kõiki lisatud taimi
let plants = [];

// Lae olemasolevad taimed localStorage'ist kui neid on
if (localStorage.getItem('plants')) {
    plants = JSON.parse(localStorage.getItem('plants'));
}

// KAARTIDE HALDAMISE FUNKTSIOONID
/**
 * Lisab ühe taimekaardi DOM'i
 * @param {Object} plant - Taime andmed (pilt, nimi, kirjeldus)
 * @param {number} index - Taime indeks massiivis
 */
const addCardToDom = (plant, index) => {
    // Loo uus kaart jQuery abil
    const $card = $('<li>').addClass('plants__card');
    
    // Loo ja seadista taime pilt
    const $image = $('<img>')
        .addClass('plants__card-image')
        .attr('src', plant.image);

    // Loo ja seadista taime pealkiri
    const $title = $('<h3>')
        .addClass('plants__card-title')
        .text(plant.name);

    // Loo ja seadista taime kirjeldus
    const $paragraph = $('<p>')
        .addClass('plants__card-paragraph')
        .text(plant.description);

    // Loo ja seadista kustutamise nupp
    const $deleteButton = $('<button>')
        .text('Kustuta')
        .addClass('plants__card-delete')
        .attr('data-index', index)
        .on('click', function() {
            deletePlant($(this).data('index'));
        });

    // Lisa kõik elemendid kaardile ja kaart DOM'i
    $card.append($image, $title, $paragraph, $deleteButton);
    $('.plants__cards').append($card);
};

/**
 * Kustutab taime massiivist ja localStorage'ist
 * @param {number} index - Kustutatava taime indeks
 */
const deletePlant = (index) => {
    plants.splice(index, 1); // Eemalda taim massiivist
    localStorage.setItem('plants', JSON.stringify(plants)); // Uuenda localStorage
    renderPlants(); // Joonista kaardid uuesti
};

// Kuvab kõik taimed DOM'is
const renderPlants = () => {
    const cards = document.querySelector('.plants__cards');
    cards.innerHTML = ''; // Puhasta olemasolevad kaardid
    plants.forEach((plant, index) => {
        addCardToDom(plant, index); // Lisa iga taim uuesti
    });
};

/**
 * Lisab uue taime massiivi ja localStorage'isse
 * @param {Object} plant - Lisatava taime andmed
 */
const addCard = (plant) => {
    plants.push(plant); // Lisa taim massiivi
    localStorage.setItem('plants', JSON.stringify(plants)); // Salvesta localStorage'isse
    renderPlants(); // Uuenda vaadet
};

// Kuva olemasolevad taimed kohe lehe laadimisel
renderPlants();

// VORMI VALIDEERIMISE FUNKTSIOONID
/**
 * Kontrollib vormi sisendite korrektsust
 * @param {File} plantImage - Üleslaetud pildifail
 * @param {string} plantName - Taime nimi
 * @param {string} plantDescription - Taime kirjeldus
 * @returns {boolean} - Kas vorm on korrektselt täidetud
 */
const validateForm = (plantImage, plantName, plantDescription) => {
    // Kontrolli, kas kõik väljad on täidetud
    if (!plantImage || !plantName || !plantDescription) {
        console.log('Validation failed: All fields are required');
        return false;
    }

    // Kontrolli nime pikkust
    if (plantName.length < 2) {
        console.log('Validation failed: Plant name must be at least 2 characters long');
        return false;
    }

    // Kontrolli kirjelduse pikkust
    if (plantDescription.length < 10) {
        console.log('Validation failed: Description must be at least 10 characters long');
        return false;
    }

    // Kontrolli pildi formaati
    const allowedTypes = ['image/jpeg', 'image/png'];
    if (!allowedTypes.includes(plantImage.type)) {
        console.log('Validation failed: File must be a JPEG or PNG image');
        return false;
    }

    console.log('Form validation passed successfully');
    return true;
};

/**
 * Kuvab veateate vormis
 * @param {string} message - Veateate tekst
 */
const showError = (message) => {
    const $errorDiv = $('<div>')
        .addClass('error-message')
        .text(message);
    
    $form.prepend($errorDiv);

    // Eemalda veateade 3 sekundi pärast
    setTimeout(() => {
        $errorDiv.fadeOut(400, function() {
            $(this).remove();
        });
    }, 3000);
};

//VORMI TÖÖTLEMINE 
// Vormi esitamise kuulaja
$form.on('submit', function(event) {
    event.preventDefault();

    // Eemalda vanad veateated
    $('.error-message').remove();

    // Hangi vormi väljad
    const $plantImageInput = $('#plant-image');
    const $plantNameInput = $('#plant-name');
    const $plantDescriptionInput = $('#plant-description');

    // Hangi väljade väärtused
    const plantImage = $plantImageInput[0].files[0];
    const plantName = $plantNameInput.val().trim();
    const plantDescription = $plantDescriptionInput.val().trim();

    // Valideeri vorm
    if (!validateForm(plantImage, plantName, plantDescription)) {
        showError('Palun täida kõik väljad korrektselt!');
        return;
    }

    console.log('Adding new plant:', {
        name: plantName,
        description: plantDescription
    });

    // Loe pildifail ja lisa uus taim
    const reader = new FileReader();
    reader.onload = (event) => {
        const plant = {
            image: event.target.result,
            name: plantName,
            description: plantDescription,
        };

        addCard(plant);
        console.log('Plant added successfully');
    };
    reader.readAsDataURL(plantImage);

    $form.reset();
});

// MODAALAKNA FUNKTSIOONID
// jQuery viited modaalakna elementidele
const $modal = $('#plant-modal');
const $modalImage = $('#modal-image');
const $modalTitle = $('#modal-title');
const $modalDescription = $('#modal-description');

/**
 * Avab modaalakna taime andmetega
 * @param {Object} plant - Kuvatava taime andmed
 */
const openModal = (plant) => {
    $modalImage.attr('src', plant.image);
    $modalTitle.text(plant.name);
    $modalDescription.text(plant.description);
    $modal.fadeIn();
};

// Sulge modaalaken nupuvajutusel
$('.modal__close').on('click', function() {
    $modal.fadeOut();
});

// Ava modaalaken kaardi klõpsamisel
$('.plants__cards').on('click', '.plants__card', function() {
    const index = $(this).index();
    const plant = plants[index];
    if (plant) openModal(plant);
});