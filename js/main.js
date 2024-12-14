// Variable definition
const form = document.querySelector('.add-form__form');
let plants = [];
if (localStorage.getItem('plants')) {
    plants = JSON.parse(localStorage.getItem('plants'));
}

// Function to add a card to DOM
const addCardToDom = (plant, index) => {
    const card = document.createElement('li');
    card.classList.add('plants__card');

    const image = document.createElement('img');
    image.classList.add('plants__card-image');
    image.src = plant.image;

    const title = document.createElement('h3');
    title.classList.add('plants__card-title');
    title.textContent = plant.name;

    const paragraph = document.createElement('p');
    paragraph.classList.add('plants__card-paragraph');
    paragraph.textContent = plant.description;

    const deleteButton = document.createElement('button');
    deleteButton.textContent = 'Kustuta';
    deleteButton.classList.add('plants__card-delete');
    deleteButton.dataset.index = index; // Save the index for identifying which plant to delete

    deleteButton.addEventListener('click', (event) => {
        const plantIndex = event.target.dataset.index;
        deletePlant(plantIndex); // Call delete function
    });

    card.appendChild(image);
    card.appendChild(title);
    card.appendChild(paragraph);
    card.appendChild(deleteButton);

    const cards = document.querySelector('.plants__cards');
    cards.appendChild(card);
};

// Function to delete a plant card
const deletePlant = (index) => {
    plants.splice(index, 1); // Remove the plant from array
    localStorage.setItem('plants', JSON.stringify(plants)); // Update localStorage
    renderPlants(); // Re-render the plant cards
};

// Function to render all plant cards
const renderPlants = () => {
    const cards = document.querySelector('.plants__cards');
    cards.innerHTML = ''; // Clear existing cards
    plants.forEach((plant, index) => {
        addCardToDom(plant, index); // Re-add each plant
    });
};

// Add new plant card
const addCard = (plant) => {
    plants.push(plant); // Add plant to array
    localStorage.setItem('plants', JSON.stringify(plants)); // Save to localStorage
    renderPlants(); // Update the DOM
};

// Display existing plants from localStorage
renderPlants();

// Form event listener for adding a new plant
form.addEventListener('submit', (event) => {
    event.preventDefault();

    const plantImageInput = document.querySelector('#plant-image');
    const plantNameInput = document.querySelector('#plant-name');
    const plantDescriptionInput = document.querySelector('#plant-description');

    const plantImage = plantImageInput.files[0];
    const plantName = plantNameInput.value;
    const plantDescription = plantDescriptionInput.value;

    const reader = new FileReader();
    reader.onload = (event) => {
        const plant = {
            image: event.target.result,
            name: plantName,
            description: plantDescription,
        };

        addCard(plant); // Add the new plant
    };
    reader.readAsDataURL(plantImage);

    form.reset();
});

// Leidke modaal ja selle elemendid
const modal = document.getElementById('plant-modal');
const modalImage = document.getElementById('modal-image');
const modalTitle = document.getElementById('modal-title');
const modalDescription = document.getElementById('modal-description');
const closeModal = document.querySelector('.modal__close');

// Funktsioon kaardile klikkimise käsitlemiseks
const openModal = (plant) => {
    modalImage.src = plant.image;
    modalTitle.textContent = plant.name;
    modalDescription.textContent = plant.description;
    modal.style.display = 'flex'; // Näita modaal
};


// Lisage nupule klõpsamisürituse kuulaja
closeModal.addEventListener('click', () => {
    modal.style.display = 'none'; // Peida modaal
});

// Lisa iga kaardi jaoks event listener
const cardsContainer = document.querySelector('.plants__cards');

cardsContainer.addEventListener('click', (event) => {
    const card = event.target.closest('.plants__card');
    if (card) {
        // Leia kaardi andmed DOM-ist
        const plantIndex = Array.from(cardsContainer.children).indexOf(card);
        const plant = plants[plantIndex];

        openModal(plant);
    }
});
