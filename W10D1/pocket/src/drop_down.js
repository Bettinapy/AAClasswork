
const dogs = {
  "Corgi": "https://www.akc.org/dog-breeds/cardigan-welsh-corgi/",
  "Australian Shepherd": "https://www.akc.org/dog-breeds/australian-shepherd/",
  "Affenpinscher": "https://www.akc.org/dog-breeds/affenpinscher/",
  "American Staffordshire Terrier": "https://www.akc.org/dog-breeds/american-staffordshire-terrier/",
  "Tosa": "https://www.akc.org/dog-breeds/tosa/",
  "Labrador Retriever": "https://www.akc.org/dog-breeds/labrador-retriever/",
  "French Bulldog": "https://www.akc.org/dog-breeds/french-bulldog/" 
};

function dogLinkCreator() {
  let result = [];
  Object.keys(dogs).forEach(dog => {
    let newA = document.createElement("a");
    newA.innerHTML = dog;
    newA.href = dogs[dog];

    let newLi = document.createElement("li");
    newLi.classList.add("dog-link");
    newLi.appendChild(newA);
    result.push(newLi);
  });
  return result;
}

function attachDogLinks(){
  let dogLinks = dogLinkCreator();
  // debugger
  let ul = document.getElementsByClassName('drop-down-dog-list');
  dogLinks.forEach(li=>{
    ul[0].appendChild(li);
  });
}
// attachDogLinks();
function handleEnter() {
  let doglist = document.querySelectorAll('.drop-down-dog-list');
  // doglist.forEach(li => {
  //   li.classList.add("display-all");
  // });

  doglist[0].classList.add("display-all");
}

function handleLeave() {
  let doglist = document.querySelectorAll('.drop-down-dog-list');
  // doglist.forEach(li => {
  //   li.classList.remove("display-all");
  // });
  doglist[0].classList.remove("display-all");
}

// dogLinkCreator();
attachDogLinks();
//let dropDown = document.getElementsByClassName('drop-down-dog-list');
const dropDown = document.querySelector('.drop-down-dog-nav');
dropDown.addEventListener('mouseenter', handleEnter);
dropDown.addEventListener('mouseleave', handleLeave);