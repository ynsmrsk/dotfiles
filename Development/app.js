const todoList = {
	todos: [],

	addTodo: function(todoText) {
		this.todos.push({
			todoText,
			completed: false
		})
	},

	changeTodo: function(index, newValue) {
		this.todos[index].todoText = newValue
	},

	deleteTodo: function(index) {
		this.todos.splice(index, 1)
	},

	toggleCompleted: function(index) {
		let todo = this.todos[index]
		todo.completed = !todo.completed
	},

	toggleAll: function() {
		let totalTodos = this.todos.length
		let completedTodos = 0
		this.todos.forEach(function(todo) {
			if(todo.completed === true) {
				completedTodos++
			}
		})
		this.todos.forEach(function(todo) {
			if(completedTodos === totalTodos) {
				todo.completed = false
			} else {
				todo.completed = true
			}
		})
	}
}

const handlers = {
	addTodo: () => {
		let addTodoTextInput = document.getElementById('addTodoTextInput')
		todoList.addTodo(addTodoTextInput.value)
		addTodoTextInput.value = ''
		view.displayTodos()
	},

	changeTodo: () => {
		let changeTodoIndexInput = document.getElementById('changeTodoIndexInput')
		let changeTodoTextInput = document.getElementById('changeTodoTextInput')
		todoList.changeTodo(changeTodoIndexInput.valueAsNumber, changeTodoTextInput.value)
		changeTodoIndexInput.value = ''
		changeTodoTextInput.value = ''
		view.displayTodos()
	},

	toggleCompleted: () => {
		let toggleCompletedIndexInput = document.getElementById('toggleCompletedIndexInput')
		todoList.toggleCompleted(toggleCompletedIndexInput.valueAsNumber)
		toggleCompletedIndexInput.value = ''
		view.displayTodos()
	},

	toggleAll: () => {
		todoList.toggleAll()
		view.displayTodos()
	}
}

const view = {
	todosUl: document.querySelector('ul'),

	displayTodos: function() {
		this.todosUl.innerHTML = ''
		todoList.todos.forEach(function(todo, index) {
			todoLi = document.createElement('li')
			if(todo.completed === true) {
				todoLi.textContent = `( ✓ ) ${todo.todoText} `
			} else {
				todoLi.textContent = `( x ) ${todo.todoText} `
			}
			todoLi.id = index
			todoLi.appendChild(this.createDeleteButton())
			this.todosUl.appendChild(todoLi)
		}, this)
	},

	createDeleteButton: function() {
		let deleteButton = document.createElement('button')
		deleteButton.textContent = 'Delete'
		deleteButton.className = 'deleteButton'
		return deleteButton
	},

	setUpEventListeners: function() {
		this.todosUl.addEventListener('click', function(event) {
		elementClicked = event.target
		if(elementClicked.className === 'deleteButton') {
			todoList.deleteTodo(parseInt(event.target.parentNode.id))
		}
		view.displayTodos()
	})
	}
}

view.setUpEventListeners()
