let todos = JSON.parse(localStorage.getItem("todos")) || [];
let ul = document.querySelector(".todos");
let form = document.querySelector('.add-todo-form');

function addTodo(e){
    // debugger;
    e.preventDefault();
    let addTodo = document.querySelector('[name = add-todo]').value;
    let todo = {
        addTodo, 
        done: false
    };
    todos.push(todo);
    //localStorage.clear();
    localStorage.setItem("todos",JSON.stringify(todos));
    populateList(todos);
    addTodo = '';
}

function populateList(todos) {
    ul.innerHTML = "";
    // debugger;
    todos.forEach(todo => {
        let newLabel = document.createElement("label");
        newLabel.innerHTML = todo["addTodo"];
        let newCheckbox =  document.createElement('input');
        newCheckbox.setAttribute('type','checkbox');
        newCheckbox.checked = todo["done"];
        let newLi = document.createElement('li');
        newLi.appendChild(newLabel);
        newLi.appendChild(newCheckbox);
        ul.appendChild(newLi);
        // debugger;
    });
}
function toggle(e){ // Event target -> target , currentTarget 
    // console.log("click");
    debugger;
    if(e.target.matches("input")){
        let target = e.target;
        todos[target.dataset.index].done = !todos[target.dataset.index].done;
        // .dataset is an method for htmlcollections so we use this to get the index of that specific one that we got from the target.
    }
}

form.addEventListener('submit', (e)=>{ 
    addTodo(e);
});
ul.addEventListener('click', (e)=> {
    toggle(e)
});
populateList(todos);