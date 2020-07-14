
const partyHeader = document.getElementById('party');

export const htmlGenerator = (string, htmlElement) => {
    if(htmlElement.children){
        let children = Array.from(htmlElement.children);
        children.forEach(child => htmlElement.removeChild(child));
    }
    const newP = document.createElement("p");
    const newContent = document.createTextNode(string);
    newP.appendChild(newContent);
    htmlElement.appendChild(newP);
};

htmlGenerator('Welcome to Pocket Project Marathon', partyHeader);
